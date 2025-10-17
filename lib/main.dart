import 'package:flutter/material.dart';

import 'pages/categoria/categoria_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, surfaceTint: Colors.transparent),
        fontFamily: 'Raleway-Bold',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.teal,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed-Bold',
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // routes: RotasApp.routes,
      home: const CategoriaPage(),
    );
  }
}
