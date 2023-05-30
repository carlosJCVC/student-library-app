import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
      width: double.infinity,
      height: 110,
      decoration: _decoration(),
      child: Column(
        children: const [
          _GreetingText(),
          _WelcomeText(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
    );
  }
}

class _GreetingText extends StatelessWidget {
  const _GreetingText();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      child: const Text(
        'Hola Carlos',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: const [
          Text(
            'Bienvenido de nuevo',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.waving_hand,
            color: Color(0xffFFAF00),
          )
        ],
      ),
    );
  }
}
