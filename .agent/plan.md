=== 1. Project Overview & Tech Stack ===

You are an expert Flutter developer. Build a complete Flutter mobile application called "MangaK" — a manga reading app with a dark/light theme system. The app connects to an existing REST API (MangaK API) with JWT authentication (access token + refresh token).

Tech stack requirements:
- Flutter 3.x (latest stable)
- State management: Riverpod (flutter_riverpod + hooks_riverpod)
- Navigation: GoRouter
- HTTP client: Dio with interceptors for JWT auto-refresh
- Local storage: flutter_secure_storage (for tokens), Hive (for cache)
- Theme: Full dark/light mode with custom ThemeData
- UI extras: Modal bottom sheets, toast notifications (fluttertoast or overlay_support), real-time push via Pusher Channels (pusher_channels_flutter)
- Image loading: cached_network_image
- Comment system with pagination
- Clean Architecture: feature-based folder structure (data / domain / presentation layers per feature)

=== 2. Folder Structure ===

Generate the complete folder structure as follows:

lib/
├── main.dart
├── app.dart                        # MaterialApp + GoRouter setup
├── core/
│   ├── constants/
│   │   ├── api_constants.dart      # base URL, endpoints
│   │   └── app_constants.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── dio_client.dart         # Dio singleton + interceptors
│   │   └── jwt_interceptor.dart    # auto-refresh logic
│   ├── storage/
│   │   └── secure_storage.dart     # token read/write
│   ├── theme/
│   │   ├── app_theme.dart          # light + dark ThemeData
│   │   ├── app_colors.dart
│   │   └── text_styles.dart
│   ├── utils/
│   │   ├── toast_utils.dart        # show success/error/info toast
│   │   └── modal_utils.dart        # showAppBottomSheet helper
│   └── widgets/
│       ├── manga_card.dart
│       ├── chapter_tile.dart
│       ├── loading_widget.dart
│       └── error_widget.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/auth_model.dart
│   │   │   └── repositories/auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/auth_entity.dart
│   │   │   ├── repositories/auth_repository.dart
│   │   │   └── usecases/login_usecase.dart
│   │   └── presentation/
│   │       ├── screens/login_screen.dart
│   │       ├── screens/register_screen.dart
│   │       └── providers/auth_provider.dart
│   ├── home/
│   │   ├── data/ domain/ presentation/  (same pattern)
│   │   └── presentation/
│   │       ├── screens/home_screen.dart
│   │       └── providers/home_provider.dart
│   ├── category/
│   ├── manga_detail/
│   ├── chapter_reader/
│   ├── comment/
│   └── notification/               # Pusher integration
└── router/
    └── app_router.dart             # GoRouter routes config

=== 3. Authentication — JWT + Refresh Token ===

Implement JWT Authentication with automatic token refresh:

1. dio_client.dart:
   - Create Dio singleton
   - Add JwtInterceptor as interceptor
   - Base options: baseUrl from ApiConstants.baseUrl, connectTimeout, receiveTimeout

2. jwt_interceptor.dart:
   - On request: attach "Authorization: Bearer {accessToken}" header
   - On response error 401:
     a. Call refresh token endpoint POST /auth/refresh with refreshToken
     b. Save new accessToken and refreshToken to SecureStorage
     c. Retry original request with new token
     d. If refresh also fails (401): clear tokens, redirect to LoginScreen via GoRouter

3. secure_storage.dart using flutter_secure_storage:
   - saveAccessToken(String token)
   - saveRefreshToken(String token)
   - getAccessToken() -> Future
   - getRefreshToken() -> Future
   - clearTokens()

4. auth_provider.dart using Riverpod:
   - AuthState: (isLoggedIn, user, isLoading, error)
   - login(email, password) -> calls LoginUseCase -> saves tokens
   - logout() -> clears tokens, redirects
   - checkAuthStatus() on app start

API endpoints:
- POST /api/auth/login        body: {email, password}
- POST /api/auth/register     body: {name, email, password}
- POST /api/auth/refresh      body: {refresh_token}
- GET  /api/auth/me           returns user profile

=== 4. Screens — Home, Category, Manga Detail ===

Build the following screens with full UI and data binding:

HOME SCREEN (home_screen.dart):
- AppBar with app logo + notification bell icon (badge with unread count from Pusher)
- Search bar (navigate to search screen on tap)
- Horizontal carousel: "Truyện Hot" (manga list, fetch GET /api/manga?sort=popular&limit=10)
- Horizontal carousel: "Mới cập nhật" (fetch GET /api/manga?sort=updated&limit=10)
- Horizontal scroll: Genre chips (fetch GET /api/categories)
- Grid (2 columns): "Đề xuất cho bạn" (GET /api/manga?sort=recommend&limit=20, pagination)
- MangaCard widget: cover image (cached), title, chapter count, last update badge

CATEGORY SCREEN (category_screen.dart):
- Route: /category/:slug
- AppBar: category name
- Filter bar: sort (newest/popular/completed), status chips
- GridView.builder 2 columns, infinite scroll (load more on scroll to bottom)
- API: GET /api/manga?category={slug}&sort={sort}&status={status}&page={page}

MANGA DETAIL SCREEN (manga_detail_screen.dart):
- Route: /manga/:slug
- Collapsible header: large cover image with gradient overlay, title, author, status badge, genres chips, rating stars
- SliverAppBar with parallax effect on scroll
- Description section (expandable text)
- Stats row: views, follows, rating
- "Đọc từ đầu" button (primary) + "Đọc tiếp" button (secondary, shows last read chapter)
- Follow/Bookmark button with toggling state (POST /api/manga/:id/follow)
- Chapter list: ListView with chapter number, title, date, read indicator
- API: GET /api/manga/:slug -> returns manga detail + chapter list

=== 5. Chapter Reader Screen ===

Build chapter reader screen (chapter_reader_screen.dart):
- Route: /manga/:slug/chapter/:chapterId
- Full-screen immersive mode (hide status bar)
- Tap center to toggle top/bottom AppBar visibility (animated fade)
- Top AppBar: back button, manga title, chapter selector dropdown
- Bottom bar: prev chapter button, progress slider (current page / total), next chapter button
- Reading mode: vertical scroll (webtoon style) is default
- Page images: load via cached_network_image with placeholder shimmer
- Image source: GET /api/chapter/:chapterId -> returns {images: [url1, url2, ...]}
- On chapter end: show "Đọc chương tiếp theo" overlay card
- Track reading progress: save last read chapter to Hive local cache
  Key: "manga_{mangaId}_last_chapter" -> chapterId
- Auto mark chapter as read: POST /api/chapter/:chapterId/read (if user is logged in)
- Preload next 2 images using precacheImage()
- Support pinch-to-zoom on individual images

=== 6. Comment System ===

Build comment system as a bottom sheet and inline section:

COMMENT WIDGET (comment_section.dart):
- Display as DraggableScrollableSheet (showAppBottomSheet)
- Paginated comment list: GET /api/manga/:id/comments?page={page}&limit=15
- Each comment: avatar, username, content, time ago, like button, reply count
- "Xem X trả lời" expand button -> load replies GET /api/comments/:id/replies
- Comment input bar (sticky at bottom): text field + emoji button + send button
  - Requires login -> if not logged in: show toast "Vui lòng đăng nhập để bình luận"
- Post comment: POST /api/manga/:id/comments  body: {content, parent_id (optional)}
- Like comment: POST /api/comments/:id/like (toggle)
- Delete own comment: DELETE /api/comments/:id (show confirm modal first)
- Optimistic UI: add comment to top of list immediately, then sync with server
- On new comment from Pusher channel (see section 7): insert at top with animation

=== 7. Pusher Realtime Notifications ===

Implement Pusher Channels for real-time notifications:

Package: pusher_channels_flutter

pusher_service.dart (singleton):
- Initialize PusherChannelsFlutter with:
  apiKey: from env/.env or constants
  cluster: from constants (e.g. "ap1")
  authEndpoint: "${ApiConstants.baseUrl}/broadcasting/auth" (for private channels)
  onAuthorizer: attach JWT access token in Authorization header

Channels to subscribe:
1. Public channel "manga-updates":
   - Event "new-chapter": {manga_id, manga_title, chapter_number, chapter_id}
   - Action: show toast notification + increment bell badge count
   
2. Private channel "private-user.{userId}" (requires auth):
   - Event "new-notification": {type, message, link}
   - Action: add to notification list, show overlay toast

notification_provider.dart (Riverpod):
- State: List, unreadCount
- addNotification(NotificationModel n)
- markAllRead()
- Persists notification list to Hive

NOTIFICATION BELL (in AppBar):
- Stack with Badge widget showing unreadCount (red dot)
- Tap -> navigate to /notifications screen
- NotificationScreen: ListView of past notifications, tap to navigate to link

TOAST SYSTEM (toast_utils.dart):
- showSuccessToast(String message)
- showErrorToast(String message)  
- showInfoToast(String message)
- showNewChapterToast({required String mangaTitle, required String chapter, required VoidCallback onTap})
All use overlay_support or fluttertoast package, positioned top center

=== 8. Theme System (Dark / Light) ===

Build complete theme system:

app_colors.dart:
- Define AppColors class with static const values
- Dark: background #0F0F13, surface #1A1A22, card #22222E, primary #E86D2F (manga orange accent)
- Light: background #F5F5F0, surface #FFFFFF, card #F0F0EC, primary #D45A1A
- Text dark: primary #FFFFFF, secondary #A0A0B0, hint #606070
- Text light: primary #1A1A22, secondary #555560, hint #909098
- Divider, error, success, warning colors for both modes

app_theme.dart:
- darkTheme: ThemeData.dark() customized with above colors
- lightTheme: ThemeData.light() customized
- Both use same font family: 'Inter' (add to pubspec)
- Custom component themes: AppBarTheme, BottomSheetTheme, CardTheme, InputDecorationTheme, ElevatedButtonTheme, OutlinedButtonTheme

theme_provider.dart (Riverpod):
- State: ThemeMode (system/dark/light)
- Persists preference to SharedPreferences key "theme_mode"
- toggleTheme(), setTheme(ThemeMode mode)

In app.dart MaterialApp.router:
- theme: AppTheme.lightTheme
- darkTheme: AppTheme.darkTheme
- themeMode: ref.watch(themeProvider)

Settings screen includes theme toggle switch (3-way: system/light/dark)

=== 9. pubspec.yaml & Dependencies ===

Generate pubspec.yaml with these dependencies:

dependencies:
  flutter:
    sdk: flutter
  # State management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5
  hooks_riverpod: ^2.5.1
  flutter_hooks: ^0.20.5
  # Navigation
  go_router: ^14.2.0
  # Network
  dio: ^5.4.3
  # Storage
  flutter_secure_storage: ^9.2.2
  hive_flutter: ^1.1.0
  shared_preferences: ^2.3.0
  # Images
  cached_network_image: ^3.3.1
  # Real-time
  pusher_channels_flutter: ^2.1.0
  # Notifications / Toast
  overlay_support: ^2.1.0
  # UI
  shimmer: ^3.0.0
  photo_view: ^0.14.0       # for pinch zoom in reader
  flutter_svg: ^2.0.10
  badges: ^3.1.2            # notification badge
  timeago: ^3.6.1           # "5 phút trước"
  # Utils
  equatable: ^2.0.5
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.4.11
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  riverpod_generator: ^2.4.0

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600

=== 10. GoRouter & Navigation ===

Setup GoRouter with auth redirect:

Routes:
  /                     -> HomeScreen (shell route with bottom nav)
  /category/:slug       -> CategoryScreen
  /manga/:slug          -> MangaDetailScreen
  /manga/:slug/chapter/:chapterId -> ChapterReaderScreen (fullscreen, no bottom nav)
  /login                -> LoginScreen
  /register             -> RegisterScreen
  /notifications        -> NotificationScreen
  /settings             -> SettingsScreen
  /profile              -> ProfileScreen (requires auth)
  /history              -> ReadingHistoryScreen

Bottom navigation tabs (ShellRoute):
  - Home (icon: home)
  - Categories (icon: grid_view)
  - History (icon: history) - requires login
  - Profile (icon: person) - requires login

Auth redirect logic in GoRouter.redirect:
  - If navigating to /profile or /history and not logged in -> redirect to /login
  - If logged in and navigating to /login or /register -> redirect to /

Pass extra context via GoRouter's extra parameter for manga detail transitions (hero animation on cover image)