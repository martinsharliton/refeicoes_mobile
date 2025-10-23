import 'package:flutter/material.dart';

import 'receita.dart';

class Categoria {
  final String id;
  final String titulo;
  final Color cor;
  final String descricao;
  final String imagemUrl;
  final List<Receita> receitas;

  const Categoria({
    required this.id,
    required this.titulo,
    this.cor = Colors.amber,
    this.descricao = '',
    this.imagemUrl = '',
    this.receitas = const [],
  });

  int get quantidadeReceitas => receitas.length;
}
