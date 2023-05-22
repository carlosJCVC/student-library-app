import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:student_library_app/src/features/auth/presentation/providers/auth_provider/auth_state.dart';
import 'package:student_library_app/src/features/auth/presentation/screens/screens.dart';
import 'package:student_library_app/src/features/books/presentation/screens/books_screen.dart';
import 'package:student_library_app/src/features/faculties/presentation/screens/faculties_screen.dart';
import 'package:student_library_app/src/features/home/presentation/screens/screens.dart';
import 'package:student_library_app/src/router/app_router_notifier.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return AppRouter().getRoutes(goRouterNotifier);
});

class AppRouter {
  final _initialRoute = '/';

  GoRouter getRoutes(GoRouterNotifier goRouterNotifier) {
    return GoRouter(
      initialLocation: _initialRoute,
      refreshListenable: goRouterNotifier,
      debugLogDiagnostics: true,
      routes: [
        buildRoute(path: '/splash', screen: const CheckAuthStatusScreen()),
        buildRoute(path: '/', screen: const HomeScreen()),
        buildRoute(path: '/login', screen: const LoginScreen()),
        buildRoute(path: '/register', screen: const RegisterScreen()),
        buildRoute(path: '/faculties', screen: const FacultiesScreen()),
        buildRoute(path: '/books', screen: const BooksScreen()),
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

  GoRoute buildRoute({required String path, required Widget screen}) {
    return GoRoute(
      path: path,
      builder: (context, state) => screen,
    );
  }
}
