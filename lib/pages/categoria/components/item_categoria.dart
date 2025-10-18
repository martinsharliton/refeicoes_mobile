import 'package:flutter/material.dart';

import '../../../models/categoria.dart';
import '../../refeicoes_categoria/refeicoes_categoria_page.dart';

class ItemCategoria extends StatelessWidget {
  final Categoria categoria;

  const ItemCategoria({required this.categoria, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selecionarCategoria(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black87,
          image: DecorationImage(image: NetworkImage(categoria.imagemUrl), fit: BoxFit.cover, opacity: 0.8),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            categoria.titulo,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void selecionarCategoria(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return RefeicoesCategoriaPage(categoria: categoria);
        },
      ),
    );
  }
}
