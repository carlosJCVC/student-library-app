import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:student_library_app/src/presentation/auth/screens/screens.dart';
import 'package:student_library_app/src/presentation/screens/screens.dart';

class AppRouter {
  final _initialRoute = '/login';

  GoRouter getRoutes() {
    return GoRouter(
      initialLocation: _initialRoute,
      debugLogDiagnostics: true,
      routes: [
        buildRoute(path: '/', screen: const HomeScreen()),
        buildRoute(path: '/login', screen: const LoginScreen()),
        buildRoute(path: '/register', screen: const RegisterScreen()),
      ],
    );
  }

  GoRoute buildRoute({required String path, required Widget screen}) {
    return GoRoute(
      path: path,
      builder: (context, state) => screen,
    );
  }
}
