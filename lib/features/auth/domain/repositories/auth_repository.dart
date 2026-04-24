import '../../data/models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(String username, String email, String password, String confirmPassword);
  Future<UserProfile> getMe();
  Future<void> logout();
}
