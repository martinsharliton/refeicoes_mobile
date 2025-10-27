import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/theme/ui/text_styles.dart';
import '../../../models/categoria/categoria_response_dto.dart';
import '../categoria_controller.dart';

class RemoverCategoriaDialog extends StatefulWidget {
  final CategoriaResponseDTO categoria;
  final CategoriaController controller;

  const RemoverCategoriaDialog({super.key, required this.controller, required this.categoria});

  @override
  State<RemoverCategoriaDialog> createState() => _RemoverCategoriaDialogState();
}

class _RemoverCategoriaDialogState extends State<RemoverCategoriaDialog> {
  CategoriaResponseDTO get categoria => widget.categoria;
  CategoriaController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remover Categoria?'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
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
                    categoria.imagemUrl!,
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
                categoria.titulo ?? '',
                style: context.textStyles.textTitleItemList.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                textAlign: TextAlign.justify,
                categoria.descricao ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.textSubTitleItemList.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.grey),
          onPressed: () {
            Modular.to.pop();
          },

          child: const Text('Cancelar'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red.shade700),
          onPressed: () async {
            Modular.to.pop();
            await controller.removerCategoriaPorId(categoria: categoria);
          },
          icon: Icon(Icons.delete),
          label: const Text('Sim'),
        ),
      ],
    );
  }
}
