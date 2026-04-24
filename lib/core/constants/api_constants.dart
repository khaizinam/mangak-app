class ApiConstants {
  static const String baseUrl = 'https://mangak.io.vn/api/v2'; // Placeholder URL
  
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refresh = '/auth/refresh';
  static const String me = '/me';
  
  // Stories endpoints
  static const String stories = '/stories';
  static const String storiesList = '/stories/list';
  static const String storiesFeatured = '/stories/featured';
  static const String storiesMostViewed = '/stories/most-viewed';
  static const String storyDetail = '/stories/detail'; // needs ID appended
  static const String storyChapters = '/stories/chapters'; // needs ID appended
  static const String chapterDetail = '/stories/chapter-detail'; // needs ID appended
  static const String categories = '/categories'; // legacy? I'll keep for now or remove if unused
  
  // Real-time
  static const String pusherAppKey = 'your_pusher_key';
  static const String pusherCluster = 'ap1';
  static const String pusherAuthEndpoint = '$baseUrl/broadcasting/auth';
}
