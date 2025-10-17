import 'package:flutter/material.dart';

import 'components/item_categoria.dart';
import '../../data/dados_ficticios.dart';

class CategoriaPage extends StatelessWidget {
  const CategoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Minhas Receitas'))),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: dataSet.map((itemLista) {
          return ItemCategoria(itemLista);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
