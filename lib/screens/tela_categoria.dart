import 'package:flutter/material.dart';
import '../components/item_categoria.dart';
import '../data/dados_ficticios.dart';

class Telacategoria extends StatelessWidget {
  const Telacategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DADOS_FICTICIOS.map((itemLista) {
          return ItemCategoria(itemLista);
        }).toList(),
      ),
    );
  }
}
