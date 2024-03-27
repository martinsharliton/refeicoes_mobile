import 'package:app03_refeicoes/utils/rotas_app.dart';
import 'package:flutter/material.dart';
import '../models/categoria.dart';

class ItemCategoria extends StatelessWidget {
  final Categoria categoria;

  const ItemCategoria(this.categoria, {super.key});

  _selecionarCategoria(BuildContext context) {
    Navigator.of(context)
        .pushNamed(RotasApp.CATEGORIA_REFEICOES, arguments: categoria);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selecionarCategoria(context),
      splashColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [categoria.cor.withOpacity(0.5), categoria.cor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(categoria.titulo),
      ),
    );
  }
}
