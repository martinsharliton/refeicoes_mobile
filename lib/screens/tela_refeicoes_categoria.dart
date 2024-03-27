import 'package:app03_refeicoes/models/categoria.dart';
import 'package:flutter/material.dart';

class TelaCategoriaRefeicoes extends StatelessWidget {
  const TelaCategoriaRefeicoes({super.key});

  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context)?.settings.arguments as Categoria;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
      ),
      body: Center(
        child: Text('Receitas por categoria: ${categoria.id}'),
      ),
    );
  }
}
