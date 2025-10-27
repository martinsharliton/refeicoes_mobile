import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../config/exetension/extension.dart';
import '../../../models/receita/receita_response_dto.dart';
import '../refeicoes_categoria_controller.dart';
import 'opcoes_refeicao_bootom_sheet.dart';

class ItemRefeicoes extends StatefulWidget {
  final RefeicoesCategoriaController controller;
  final ReceitaResponseDTO receita;

  const ItemRefeicoes({super.key, required this.receita, required this.controller});

  @override
  State<ItemRefeicoes> createState() => _ItemRefeicoesState();
}

class _ItemRefeicoesState extends State<ItemRefeicoes> {
  RefeicoesCategoriaController get controller => widget.controller;
  ReceitaResponseDTO get receita => widget.receita;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        abrirTelaReceitaRefeicao();
      },
      onDoubleTap: () {
        abrirOpcoesRefeicaoBootomSheet();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                receita.imagemUrl ?? '',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade600),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    ),
                  );
                },
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
                  Text(widget.receita.titulo ?? '-', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [const Icon(Icons.schedule, size: 16), Text('${widget.receita.tempoPreparo} min')],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          const Icon(Icons.work, size: 16),
                          Text(widget.receita.dificuldade?.toLowerCase().capitalize() ?? '-'),
                        ],
                      ),
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

  Future<void> abrirTelaReceitaRefeicao() async {
    await Modular.to.pushNamed(routeReceitaRefeicao, arguments: receita);
  }

  void abrirOpcoesRefeicaoBootomSheet() async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return OpcoesRefeicaoBootomSheet(receita: receita, controller: controller);
      },
    );
  }
}
