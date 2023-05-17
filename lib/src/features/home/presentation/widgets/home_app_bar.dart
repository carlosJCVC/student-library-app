import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 200,
      decoration: _decoration(),
      child: Column(
        children: const [
          _GreetingText(),
          _WelcomeText(),
          SizedBox(height: 15),
          _InputSearch()
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      color: Color(0xff7E32E3),
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
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        'Hi Carlos',
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: const [
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
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

class _InputSearch extends StatelessWidget {
  const _InputSearch();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.white,
          hintText: 'what category are you searching for?',
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: const Color(0xffB092ED),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xffB092ED)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
