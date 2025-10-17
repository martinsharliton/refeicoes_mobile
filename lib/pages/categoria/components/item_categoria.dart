import 'package:flutter/material.dart';

import '../../../models/categoria.dart';
import '../../refeicoes_categoria/refeicoes_categoria_page.dart';

class ItemCategoria extends StatelessWidget {
  final Categoria categoria;

  const ItemCategoria(this.categoria, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selecionarCategoria(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: categoria.cor),
        child: Text(
          categoria.titulo,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  void selecionarCategoria(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RefeicoesCategoriaPage(categoria: categoria)));
  }
}
