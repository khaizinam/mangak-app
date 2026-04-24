import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';
import '../constants/api_constants.dart';
import '../events/auth_events.dart';

class JwtInterceptor extends Interceptor {
  final SecureStorage _storage;
  final Dio _dio;

  JwtInterceptor(this._storage, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip adding token for specific auth endpoints
    final path = options.path;
    final skipPaths = [ApiConstants.login, ApiConstants.register, ApiConstants.refresh];
    
    if (skipPaths.any((p) => path.contains(p))) {
      return handler.next(options);
    }

    final token = await _storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken != null) {
        try {
          // Attempt to refresh token
          final response = await _dio.post(
            ApiConstants.refresh,
            data: {'refresh_token': refreshToken},
            options: Options(headers: {'No-Retry': 'true'}),
          );

          if (response.statusCode == 200) {
            final responseData = response.data;
            final tokenData = responseData['data'] ?? responseData;
            
            final newAccessToken = tokenData['access_token'];
            final newRefreshToken = tokenData['refresh_token'];

            if (newAccessToken != null) {
              await _storage.saveAccessToken(newAccessToken);
            }
            if (newRefreshToken != null) {
              await _storage.saveRefreshToken(newRefreshToken);
            }

            // Retry the original request
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newAccessToken';
            
            final retryResponse = await _dio.fetch(options);
            return handler.resolve(retryResponse);
          }
        } catch (e) {
          // Refresh failed
          await _storage.clearTokens();
          authLogoutController.add(null);
        }
      } else {
        // No refresh token available, logout immediately
        await _storage.clearTokens();
        authLogoutController.add(null);
      }
    }
    return handler.next(err);
  }
}
