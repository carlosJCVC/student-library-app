import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:student_library_app/src/features/auth/presentation/providers/auth_provider/auth_state.dart';
import 'package:student_library_app/src/features/auth/presentation/screens/screens.dart';
import 'package:student_library_app/src/features/books/presentation/screens/screens.dart';
import 'package:student_library_app/src/features/faculties/presentation/screens/faculties_screen.dart';
import 'package:student_library_app/src/features/home/presentation/screens/screens.dart';
import 'package:student_library_app/src/router/app_router_notifier.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return AppRouter().getRoutes(goRouterNotifier);
});

class AppRouter {
  final _initialRoute = '/home';

  GoRouter getRoutes(GoRouterNotifier goRouterNotifier) {
    return GoRouter(
      initialLocation: _initialRoute,
      refreshListenable: goRouterNotifier,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const CheckAuthStatusScreen(),
        ),
        GoRoute(
          path: '/home',
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
          path: '/faculties',
          builder: (context, state) => const FacultiesScreen(),
        ),
        GoRoute(
          path: '/books',
          builder: (context, state) => const BooksScreen(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final bookId = int.parse(state.pathParameters["id"] ?? '0');

                return BookScreen(bookId: bookId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/',
          redirect: (_, __) => '/home/0',
        )
      ],
      // redirect: (context, state) {
      //   final isGoingTo = state.matchedLocation;
      //   final authStatus = goRouterNotifier.authStatus;

      //   if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
      //     return null;
      //   }

      //   if (authStatus == AuthStatus.unauthenticated) {
      //     if (isGoingTo == '/login' || isGoingTo == '/register') return null;

      //     // return '/login';
      //     return '/';
      //   }

      //   if (authStatus == AuthStatus.authenticated) {
      //     if (isGoingTo == '/login' ||
      //         isGoingTo == '/register' ||
      //         isGoingTo == '/splash') {
      //       return '/';
      //     }
      //   }

      //   return null;
      // },
    );
  }
}
