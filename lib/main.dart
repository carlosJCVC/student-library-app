import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/config/constants/environment.dart';
import 'package:student_library_app/src/router/app_router.dart';
import 'package:student_library_app/src/theme/app_theme.dart';

void main() async {
  await Environment.initEnvironment();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Student Library',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
