import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import '../../data/models/auth_model.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/events/auth_events.dart';

class AuthState {
  final bool isLoggedIn;
  final UserProfile? user;
  final bool isLoading;
  final String? error;

  AuthState({
    this.isLoggedIn = false,
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isLoggedIn,
    UserProfile? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  final Ref ref;


  AuthNotifier(this._repository, this.ref) : super(AuthState()) {
    checkAuthStatus();
    
    // Listen for global logout events from JwtInterceptor
    _logoutSubscription = authLogoutController.stream.listen((_) {
      if (state.isLoggedIn) {
        logout();
      }
    });
  }

  late final StreamSubscription<void> _logoutSubscription;

  @override
  void dispose() {
    _logoutSubscription.cancel();
    super.dispose();
  }

  Future<void> checkAuthStatus() async {
    state = state.copyWith(isLoading: true);
    
    // Set a minimum duration for the splash screen
    final startTime = DateTime.now();

    try {
      final storage = ref.read(secureStorageProvider);
      final refreshToken = await storage.getRefreshToken();
      
      if (refreshToken == null) {
        await _finishLoading(startTime);
        state = state.copyWith(isLoggedIn: false, isLoading: false);
        return;
      }

      try {
        // getMe will trigger the JwtInterceptor's auto-refresh if 401 occurs
        final user = await _repository.getMe();
        await _finishLoading(startTime);
        state = state.copyWith(isLoggedIn: true, user: user, isLoading: false);
      } catch (e) {
        // Fallback: try auto-login with saved credentials if token check fails
        final credentials = await storage.getCredentials();
        if (credentials != null) {
          try {
            final loginResponse = await _repository.login(
              credentials['email']!,
              credentials['password']!,
            );
            await storage.saveAccessToken(loginResponse.accessToken);
            await storage.saveRefreshToken(loginResponse.refreshToken);
            await _finishLoading(startTime);
            state = state.copyWith(isLoggedIn: true, user: loginResponse.user, isLoading: false);
            return;
          } catch (_) {
            // Auto-login failed, proceed to logout
          }
        }
        
        await _finishLoading(startTime);
        state = state.copyWith(isLoggedIn: false, isLoading: false);
      }
    } catch (e) {
      await _finishLoading(startTime);
      state = state.copyWith(isLoggedIn: false, isLoading: false);
    }
  }

  Future<void> _finishLoading(DateTime startTime) async {
    final elapsed = DateTime.now().difference(startTime);
    const minDuration = Duration(seconds: 2);
    if (elapsed < minDuration) {
      await Future.delayed(minDuration - elapsed);
    }
  }

  Future<void> login(String email, String password, {bool rememberMe = true}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _repository.login(email, password);
      final storage = ref.read(secureStorageProvider);
      await storage.saveAccessToken(response.accessToken);
      await storage.saveRefreshToken(response.refreshToken);
      
      if (rememberMe) {
        await storage.saveCredentials(email, password);
      } else {
        await storage.clearCredentials();
      }

      state = state.copyWith(isLoggedIn: true, user: response.user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: _getErrorMessage(e));
    }
  }

  Future<void> register(String username, String email, String password, String confirmPassword) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _repository.register(username, email, password, confirmPassword);
      final storage = ref.read(secureStorageProvider);
      await storage.saveAccessToken(response.accessToken);
      await storage.saveRefreshToken(response.refreshToken);
      state = state.copyWith(isLoggedIn: true, user: response.user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: _getErrorMessage(e));
    }
  }

  Future<void> logout() async {
    final storage = ref.read(secureStorageProvider);
    await storage.clearTokens();
    state = AuthState();
  }

  String _getErrorMessage(dynamic e) {
    if (e is DioException) {
      if (e.response?.data != null && e.response?.data is Map) {
        return e.response?.data['message'] ?? e.message ?? e.toString();
      }
      return e.message ?? e.toString();
    }
    return e.toString();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioClient = ref.watch(dioProvider);
  return AuthRepositoryImpl(dioClient.dio);
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository, ref);
});
