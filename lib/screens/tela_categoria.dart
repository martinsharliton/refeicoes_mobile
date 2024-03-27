import 'package:flutter/material.dart';
import '../components/item_categoria.dart';
import '../data/dados_ficticios.dart';

class TelaCategoria extends StatelessWidget {
  const TelaCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text(
            'Vamos Cozinhar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
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
