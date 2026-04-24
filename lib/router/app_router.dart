import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/manga_detail/presentation/screens/manga_detail_screen.dart';
import '../features/chapter_reader/presentation/screens/chapter_reader_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);


  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegistering = state.matchedLocation == '/register';

      if (!isLoggedIn && !isLoggingIn && !isRegistering) return '/login';
      if (isLoggedIn && (isLoggingIn || isRegistering)) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
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
        path: '/manga/:slug',
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return MangaDetailScreen(slug: slug);
        },
      ),
      GoRoute(
        path: '/manga/:slug/chapter/:chapterId',
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          final chapterId = int.parse(state.pathParameters['chapterId']!);
          return ChapterReaderScreen(slug: slug, chapterId: chapterId);
        },
      ),
    ],
  );
});

