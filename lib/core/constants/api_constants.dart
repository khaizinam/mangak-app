class ApiConstants {
  static const String baseUrl = 'https://mangak.io.vn/api/v2'; // Placeholder URL
  
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refresh = '/auth/refresh';
  static const String me = '/me';
  
  // Manga endpoints
  static const String manga = '/manga';
  static const String categories = '/categories';
  static const String chapter = '/chapter';
  
  // Real-time
  static const String pusherAppKey = 'your_pusher_key';
  static const String pusherCluster = 'ap1';
  static const String pusherAuthEndpoint = '$baseUrl/broadcasting/auth';
}
