import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/auth/domain/repositories/auth_repository.dart';
import 'package:social_network/features/auth/data/models/auth_model.dart';


class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;

  AuthRepositoryImpl(this._dio);

  @override
  Future<AuthResponse> login(String email, String password) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    
    final responseData = response.data;
    if (responseData is Map && responseData['success'] == false) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: responseData['message'],
      );
    }
    
    final authData = responseData['data'] ?? responseData;
    return AuthResponse.fromJson(authData);
  }

  @override
  Future<AuthResponse> register(String username, String email, String password, String confirmPassword) async {
    final response = await _dio.post(
      ApiConstants.register,
      data: {
        'username': username,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
      },
    );
    
    final responseData = response.data;
    if (responseData is Map && responseData['success'] == false) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: responseData['message'],
      );
    }

    final authData = responseData['data'] ?? responseData;
    return AuthResponse.fromJson(authData);
  }

  @override
  Future<UserProfile> getMe() async {
    final response = await _dio.get(ApiConstants.me);
    final responseData = response.data;
    final userData = responseData['data'] ?? responseData;
    return UserProfile.fromJson(userData);
  }

  @override
  Future<void> logout() async {
    // Usually logout involves clearing tokens and potentially a server-side invalidate
    // In this app, we handle token clearing in the provider
  }
}
