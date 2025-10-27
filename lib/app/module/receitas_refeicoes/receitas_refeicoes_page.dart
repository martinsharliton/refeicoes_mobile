import 'package:flutter/material.dart';

import '../../models/receita/receita_response_dto.dart';
import 'components/item_receita_refeicao.dart';

class ReceitasRefeicoesPage extends StatefulWidget {
  final ReceitaResponseDTO receita;

  const ReceitasRefeicoesPage({super.key, required this.receita});

  @override
  State<ReceitasRefeicoesPage> createState() => _ReceitasRefeicoesPageState();
}

class _ReceitasRefeicoesPageState extends State<ReceitasRefeicoesPage> {
  ReceitaResponseDTO get receita => widget.receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita.titulo ?? '-')),
      body: ListView(
        padding: EdgeInsets.only(bottom: 100),
        children: [
          Stack(
            children: [
              Center(
                child: Image.network(
                  width: 849,
                  height: 300,
                  receita.imagemUrl ?? '-',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 100);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    receita.descricao ?? '-',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) {
              if ((widget.receita.ingredientes?.isEmpty ?? true) && (widget.receita.passos?.isEmpty ?? true)) {
                return Center(
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Nenhum item disponível para esta receita.', style: TextStyle(fontSize: 16)),
                  ),
                );
              }

              return Column(
                children: [
                  Visibility(
                    visible: receita.ingredientes?.isNotEmpty ?? false,
                    child: ItemReceitaRefeicao(titulo: 'Ingredientes', itens: receita.ingredientes ?? []),
                  ),
                  Visibility(
                    visible: receita.passos?.isNotEmpty ?? false,
                    child: ItemReceitaRefeicao(titulo: 'Passos', itens: receita.passos ?? []),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
