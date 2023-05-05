import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_library_app/src/presentation/widgets/widgets.dart';

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

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Login', style: textTheme.titleLarge),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye_outlined),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Login',
              buttonColor: Colors.black,
              onPressed: () {},
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
