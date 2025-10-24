import 'package:flutter/material.dart';

import '../../models/categoria/categoria_response_dto.dart';

class RefeicoesCategoriaPage extends StatefulWidget {
  final CategoriaResponseDTO categoria;
  const RefeicoesCategoriaPage({super.key, required this.categoria});

  @override
  State<RefeicoesCategoriaPage> createState() => _RefeicoesCategoriaPageState();
}

class _RefeicoesCategoriaPageState extends State<RefeicoesCategoriaPage> {
  CategoriaResponseDTO get categoria => widget.categoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoria.titulo ?? '-')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Builder(
          builder: (context) {
            // if (receitas.isEmpty) {
            //   return const Center(
            //     child: Text(
            //       'Nenhuma receita disponível para esta categoria.',
            //       style: TextStyle(fontSize: 16, color: Colors.black),
            //     ),
            //   );
            // }

            // return Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   spacing: 5,
            //   children: [
            //     Text(categoria.descricao, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //     Flexible(
            //       child: ListView.builder(
            //         itemCount: receitas.length,
            //         itemBuilder: (context, index) {
            //           final receita = receitas[index];
            //           return ItemRefeicoes(receita: receita, cor: categoria.cor);
            //         },
            //       ),
            //     ),
            //   ],
            // );

            return Center(
              child: Text(
                'Página de refeições para a categoria: ${categoria.titulo}',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }
}
