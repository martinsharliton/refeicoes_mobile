import 'package:flutter/material.dart';

import '../../data/dados_ficticios.dart';
import 'components/item_categoria.dart';

class CategoriaPage extends StatelessWidget {
  const CategoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    dataSet.sort((a, b) => a.titulo.compareTo(b.titulo));

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Minhas Receitas')),
        backgroundColor: Color.fromARGB(255, 207, 171, 137),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(title: const Text('Navegação'), automaticallyImplyLeading: false, backgroundColor: Colors.black87),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Categorias'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 50),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: dataSet.map((categoria) {
          return ItemCategoria(categoria: categoria);
        }).toList(),
      ),
    );
  }
}
