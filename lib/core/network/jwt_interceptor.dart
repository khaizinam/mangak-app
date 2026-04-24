import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';
import '../constants/api_constants.dart';

class JwtInterceptor extends Interceptor {
  final SecureStorage _storage;
  final Dio _dio;

  JwtInterceptor(this._storage, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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
            final newAccessToken = response.data['access_token'];
            final newRefreshToken = response.data['refresh_token'];

            await _storage.saveAccessToken(newAccessToken);
            await _storage.saveRefreshToken(newRefreshToken);

            // Retry the original request
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newAccessToken';
            
            final retryResponse = await _dio.fetch(options);
            return handler.resolve(retryResponse);
          }
        } catch (e) {
          // Refresh failed
          await _storage.clearTokens();
          // TODO: Trigger logout / Redirect to login via GoRouter
        }
      }
    }
    return handler.next(err);
  }
}
