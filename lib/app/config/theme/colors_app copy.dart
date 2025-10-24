import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF012970);
  Color get secondary => const Color(0xFF0D6EFD);
  Color get terciary => const Color(0xFF485d92);
  Color get lightGrey => const Color(0xFFDADADA);
  Color get semInternet => Colors.red.shade900;
  Color get imageTCE => const Color.fromARGB(255, 190, 175, 143);
  Color get background => const Color(0xFFf6f9ff);
}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
