import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';
import '../constants/api_constants.dart';
import '../events/auth_events.dart';

class JwtInterceptor extends Interceptor {
  final SecureStorage _storage;
  final Dio _dio;
  bool _isRefreshing = false;
  final List<void Function(String)> _refreshQueue = [];

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
      final options = err.requestOptions;

      // If the request already tried to refresh and failed, or is an auth endpoint, don't retry
      if (options.headers.containsKey('No-Retry')) {
        return handler.next(err);
      }

      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) {
        await _storage.clearTokens();
        authLogoutController.add(null);
        return handler.next(err);
      }

      if (_isRefreshing) {
        // If already refreshing, add this request to the queue
        _refreshQueue.add((token) async {
          options.headers['Authorization'] = 'Bearer $token';
          try {
            final response = await _dio.fetch(options);
            handler.resolve(response);
          } on DioException catch (e) {
            handler.reject(e);
          } catch (e) {
            handler.reject(DioException(requestOptions: options, error: e));
          }
        });
        return;
      }

      _isRefreshing = true;

      try {
        // Attempt to refresh token
        final response = await _dio.post(
          ApiConstants.refresh,
          data: {'refresh_token': refreshToken},
          options: Options(headers: {'No-Retry': 'true'}),
        );

        if (response.statusCode == 200) {
          final responseData = response.data;
          // Support both { data: { access_token: ... } } and { access_token: ... }
          final tokenData = responseData['data'] ?? responseData;
          
          final newAccessToken = tokenData['access_token'];
          final newRefreshToken = tokenData['refresh_token'];

          if (newAccessToken != null) {
            await _storage.saveAccessToken(newAccessToken);
          }
          if (newRefreshToken != null) {
            await _storage.saveRefreshToken(newRefreshToken);
          }

          _isRefreshing = false;

          // Retry the original request with new token
          options.headers['Authorization'] = 'Bearer $newAccessToken';
          final retryResponse = await _dio.fetch(options);
          
          // Process all queued requests
          for (final callback in List.of(_refreshQueue)) {
            callback(newAccessToken as String);
          }
          _refreshQueue.clear();

          return handler.resolve(retryResponse);
        }
      } catch (e) {
        // Refresh failed (e.g., refresh token expired)
        _isRefreshing = false;
        _refreshQueue.clear();
        await _storage.clearTokens();
        authLogoutController.add(null);
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}
