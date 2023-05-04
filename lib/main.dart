import 'package:flutter/material.dart';
import 'package:student_library_app/src/router/app_router.dart';
import 'package:student_library_app/src/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Student Library',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
