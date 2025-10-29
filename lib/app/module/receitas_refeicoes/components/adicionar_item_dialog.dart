import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/theme/ui/colors_app.dart';

class AdicionarItemDialog extends StatefulWidget {
  const AdicionarItemDialog({super.key});

  @override
  State<AdicionarItemDialog> createState() => _RemoverCategoriaDialogState();
}

class _RemoverCategoriaDialogState extends State<AdicionarItemDialog> {
  final TextEditingController nomeTEC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Novo item'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: nomeTEC,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(label: Text('Nome do Item')),
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
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: context.colors.primary),
          onPressed: () async {
            Modular.to.pop(nomeTEC.text);
          },
          icon: Icon(Icons.add),
          label: const Text('Salvar'),
        ),
      ],
    );
  }
}
