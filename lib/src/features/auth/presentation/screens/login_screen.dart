import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/providers.dart';
import 'package:student_library_app/src/features/auth/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Icon(
                  Icons.school_outlined,
                  color: Colors.white,
                  size: 100,
                ),
                Container(
                  width: double.infinity,
                  height: size.height - 200,
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: const _LoginForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;

      showSnackbar(context, next.errorMessage);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Login', style: textTheme.titleLarge),
          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye_outlined),
            ),
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Login',
              buttonColor: Colors.black,
              onPressed: loginForm.isPosting
                  ? null
                  : ref.read(loginFormProvider.notifier).onFormSubmit,
            ),
          ),
          const Spacer(flex: 2),
          Row(
            children: [
              const Text('You don;t have an account?'),
              TextButton(
                onPressed: () => context.push('/register'),
                child: const Text('Sign up'),
              )
            ],
          ),
          const Spacer(flex: 1)
        ],
      ),
    );
  }
}
