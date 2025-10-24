import 'package:flutter/material.dart';

import '../../../config/exetension/extension.dart';
import '../../../models/receita/receita_response_dto.dart';
import '../../receitas_refeicoes/receitas_refeicoes_page.dart';

class ItemRefeicoes extends StatelessWidget {
  final ReceitaResponseDTO receita;
  final Color cor;

  const ItemRefeicoes({super.key, required this.receita, required this.cor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selecionarRefeicao(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                receita.imagemUrl ?? '-',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Icon(Icons.image_not_supported_outlined, size: 80),
                      ),
                      Divider(height: 0, color: Colors.grey.withValues(alpha: 0.5)),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(receita.titulo ?? '-', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(spacing: 5, children: [const Icon(Icons.schedule, size: 16), Text('${receita.tempoPreparo} min')]),
                      Row(spacing: 5, children: [const Icon(Icons.work, size: 16), Text(receita.dificuldade?.capitalize() ?? '-')]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selecionarRefeicao(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return ReceitasRefeicoesPage(receita: receita, cor: cor);
        },
      ),
    );
  }
}
