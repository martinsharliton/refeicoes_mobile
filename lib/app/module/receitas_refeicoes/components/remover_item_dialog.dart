import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/theme/ui/text_styles.dart';

class RemoverItemDialog extends StatefulWidget {
  final String titulo;
  final String item;

  const RemoverItemDialog({super.key, required this.item, required this.titulo});

  @override
  State<RemoverItemDialog> createState() => _RemoverCategoriaDialogState();
}

class _RemoverCategoriaDialogState extends State<RemoverItemDialog> {
  String get titulo => widget.titulo;
  String get item => widget.item;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remover item?'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'Deseja mesmo remover o ${titulo.substring(0, titulo.length - 1).toLowerCase()}: "$item"?',
                style: context.textStyles.textSubTitleItemList.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
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
            Modular.to.pop(false);
          },

          child: const Text('Cancelar'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red.shade700),
          onPressed: () async {
            Modular.to.pop(true);
          },
          icon: Icon(Icons.delete),
          label: const Text('Sim'),
        ),
      ],
    );
  }
}
