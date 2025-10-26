import 'package:flutter/material.dart';

import '../../../config/theme/ui/colors_app.dart';
import '../../../config/theme/ui/text_styles.dart';
import '../../../models/categoria/categoria_response_dto.dart';

class OpcoesCategoriaBootomSheet extends StatefulWidget {
  final CategoriaResponseDTO categoria;

  const OpcoesCategoriaBootomSheet({super.key, required this.categoria});

  @override
  State<OpcoesCategoriaBootomSheet> createState() => _OpcoesCategoriaBootomSheetState();
}

class _OpcoesCategoriaBootomSheetState extends State<OpcoesCategoriaBootomSheet> {
  CategoriaResponseDTO get categoria => widget.categoria;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                categoria.descricao ?? '',
                style: context.textStyles.textSubTitleItemList.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              spacing: 5,
              children: [
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
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                      icon: Icon(Icons.delete),
                      label: Text(
                        'Deletar',
                        style: context.textStyles.textTitleItemList.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
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
