import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/manga_detail/presentation/screens/manga_detail_screen.dart';
import '../features/chapter_reader/presentation/screens/chapter_reader_screen.dart';
import '../features/search/presentation/screens/search_screen.dart';
import '../features/home/presentation/screens/category_detail_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      if (authState.isLoading) return null;

      final isLoggedIn = authState.isLoggedIn;
      final isSplash = state.matchedLocation == '/splash';
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegistering = state.matchedLocation == '/register';

      if (isSplash) return isLoggedIn ? '/' : '/login';
      if (!isLoggedIn && !isLoggingIn && !isRegistering) return '/login';
      if (isLoggedIn && (isLoggingIn || isRegistering || isSplash)) return '/';

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/category/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final name = state.uri.queryParameters['name'] ?? 'Danh mục';
          return CategoryDetailScreen(categoryId: id, categoryName: name);
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/manga/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MangaDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: '/manga/:id/chapter/:chapterId',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final chapterId = state.pathParameters['chapterId']!;
          return ChapterReaderScreen(id: id, chapterId: chapterId);
        },
      ),
    ],
  );
});
