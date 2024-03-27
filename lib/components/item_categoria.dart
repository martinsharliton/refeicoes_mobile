import 'package:flutter/material.dart';
import '../models/categoria.dart';

class ItemCategoria extends StatelessWidget {
  final Categoria categoria;

  const ItemCategoria(this.categoria, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(categoria.titulo),
    );
  }
}
