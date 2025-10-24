import 'package:flutter/material.dart';

class SettingsTheme {
  SettingsTheme._();

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 240, 219, 200), surfaceTint: Colors.transparent),
    fontFamily: 'Raleway-Bold',
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    scaffoldBackgroundColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.blueGrey,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoCondensed-Bold',
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
