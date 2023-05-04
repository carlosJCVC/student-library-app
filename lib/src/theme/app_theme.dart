import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.red,
  Colors.amber,
  Colors.blue,
  Colors.orange,
  Color.fromARGB(255, 27, 230, 71),
  Color.fromARGB(255, 231, 255, 15),
  Color.fromARGB(255, 20, 228, 217),
  Color.fromARGB(255, 228, 54, 244),
  Color.fromARGB(255, 70, 244, 54),
  Color.fromARGB(255, 244, 54, 101),
  Color(0xff424CB8),
];

const scaffoldBackgroundColor = Color(0xFFF8F7F7);

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      //* General Config
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: colors[10],

      //* Texts

      //* Scaffold Background Color
      scaffoldBackgroundColor: scaffoldBackgroundColor,

      //* Buttons

      //* AppBar
      appBarTheme: const AppBarTheme(
        color: scaffoldBackgroundColor,
      ),
    );
  }
}
