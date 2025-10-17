import 'package:flutter/material.dart';

import '../../models/categoria.dart';
import '../../models/receita.dart';
import 'components/item_refeicoes.dart';

class RefeicoesCategoriaPage extends StatefulWidget {
  final Categoria categoria;
  const RefeicoesCategoriaPage({super.key, required this.categoria});

  @override
  State<RefeicoesCategoriaPage> createState() => _RefeicoesCategoriaPageState();
}

class _RefeicoesCategoriaPageState extends State<RefeicoesCategoriaPage> {
  Categoria get categoria => widget.categoria;
  List<Receita> get receitas => categoria.receitas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoria.titulo), backgroundColor: categoria.cor),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Builder(
          builder: (context) {
            if (receitas.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhuma receita disponível para esta categoria.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(categoria.descricao, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Flexible(
                  child: ListView.builder(
                    itemCount: receitas.length,
                    itemBuilder: (context, index) {
                      final receita = receitas[index];
                      return ItemRefeicoes(receita: receita);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
