import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/auth_provider/auth_provider.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/login_form_provider/login_form_notifier.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/login_form_provider/login_form_state.dart';

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).login;

  return LoginFormNotifier(loginUserCallback: loginUserCallback);
});
