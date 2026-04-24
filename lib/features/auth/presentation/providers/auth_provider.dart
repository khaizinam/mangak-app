import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import '../../data/models/auth_model.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/network/dio_provider.dart';

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
  }

  Future<void> checkAuthStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final storage = ref.read(secureStorageProvider);
      final token = await storage.getAccessToken();
      if (token != null) {
        final user = await _repository.getMe();
        state = state.copyWith(isLoggedIn: true, user: user, isLoading: false);
      } else {
        state = state.copyWith(isLoggedIn: false, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoggedIn: false, isLoading: false);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _repository.login(email, password);
      final storage = ref.read(secureStorageProvider);
      await storage.saveAccessToken(response.accessToken);
      await storage.saveRefreshToken(response.refreshToken);
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
