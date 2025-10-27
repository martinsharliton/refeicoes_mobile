import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../config/theme/ui/colors_app.dart';
import '../../../config/theme/ui/text_styles.dart';
import '../../../models/receita/receita_response_dto.dart';
import '../refeicoes_categoria_controller.dart';

class OpcoesRefeicaoBootomSheet extends StatefulWidget {
  final RefeicoesCategoriaController controller;
  final ReceitaResponseDTO receita;

  const OpcoesRefeicaoBootomSheet({super.key, required this.receita, required this.controller});

  @override
  State<OpcoesRefeicaoBootomSheet> createState() => _OpcoesRefeicaoBootomSheetState();
}

class _OpcoesRefeicaoBootomSheetState extends State<OpcoesRefeicaoBootomSheet> {
  RefeicoesCategoriaController get controller => widget.controller;
  ReceitaResponseDTO get receita => widget.receita;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    receita.imagemUrl ?? '',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(.9),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
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
                      return Icon(Icons.image_not_supported, color: Colors.grey.shade600, size: 30);
                    },
                  ),
                ),
              ),
              title: Text(
                receita.titulo ?? '',
                style: context.textStyles.textTitleItemList.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                textAlign: TextAlign.justify,
                receita.descricao ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.textSubTitleItemList.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.secondary,
                        foregroundColor: Colors.white,
                      ),
                      icon: Icon(Icons.open_in_new),
                      label: Text(
                        'Entrar',
                        style: context.textStyles.textTitleItemList.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        Modular.to.pop();
                        Modular.to.pushNamed(routeReceitaRefeicao, arguments: receita);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        foregroundColor: Colors.white,
                      ),
                      icon: Icon(Icons.edit),
                      label: Text(
                        'Editar',
                        style: context.textStyles.textTitleItemList.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        Modular.to.pop();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
                        foregroundColor: Colors.white,
                      ),
                      icon: Icon(Icons.delete),
                      label: Text(
                        'Deletar',
                        style: context.textStyles.textTitleItemList.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () async {
                        // Modular.to.pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
