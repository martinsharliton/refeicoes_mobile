import 'package:app03_refeicoes/utils/rotas_app.dart';
import 'package:flutter/material.dart';

import './screens/tela_categoria.dart';
import './screens/tela_refeicoes_categoria.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway-Bold',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      //home: const TelaCategoria(),

      // -- Rotas do aplicativo --
      routes: {
        RotasApp.HOME: ((context) => const TelaCategoria()),
        RotasApp.CATEGORIA_REFEICOES: ((context) => const TelaCategoriaRefeicoes()),
      },
    );
  }
}
