import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../config/theme/components/seletor_imagens.dart';
import '../../../models/categoria/categoria_model.dart';
import '../categoria_controller.dart';

class AdicionarCategoriaDialog extends StatefulWidget {
  final CategoriaController controller;
  const AdicionarCategoriaDialog({super.key, required this.controller});

  @override
  State<AdicionarCategoriaDialog> createState() => _AdicionarCategoriaDialogState();
}

class _AdicionarCategoriaDialogState extends State<AdicionarCategoriaDialog> {
  CategoriaController get controller => widget.controller;
  String? get imagemSelecionada => controller.imagemSelecionada;
  bool get imagemError => controller.imagemError;

  late GlobalKey<FormState> formKey;
  late TextEditingController tituloTEC;
  late TextEditingController descricaoTEC;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    tituloTEC = TextEditingController();
    descricaoTEC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tituloTEC.dispose();
    descricaoTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova Categoria', textAlign: TextAlign.center),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: Observer(
            builder: (context) => ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: tituloTEC,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(labelText: 'Nome da Categoria'),
                  validator: Validatorless.required('O nome da categoria é obrigatório'),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: descricaoTEC,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(labelText: 'Descrição da Categoria'),
                  validator: Validatorless.required('A descrição da categoria é obrigatória'),
                ),

                if (imagemSelecionada != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(imagemSelecionada!, height: 150, width: double.infinity, fit: BoxFit.cover),
                    ),
                  ),

                if (imagemError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 5),
                    child: Text(
                      'Por favor, selecione uma imagem',
                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                    ),
                  ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: imagemSelecionada != null ? 0 : 8.0),
                    child: TextButton(
                      onPressed: () async {
                        final imageURL = await abrirSeletorDeImagens();

                        if (imageURL != null) {
                          controller.setImage(imageURL);
                          controller.setImageError(false);
                        }
                      },
                      child: Text(imagemSelecionada == null ? 'Selecionar Imagem' : 'Alterar Imagem'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
            controller.setImage(null);
            controller.setImageError(false);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();

            final formIsValid = formKey.currentState?.validate() ?? false;
            final imageIsValid = controller.imagemSelecionada != null;

            if (!imageIsValid) {
              controller.setImageError(true);
            }

            if (formIsValid && imageIsValid) {
              Modular.to.pop();

              final categoria = CategoriaModel();
              categoria.titulo = tituloTEC.text;
              categoria.descricao = descricaoTEC.text;
              categoria.imagemUrl = controller.imagemSelecionada;

              await controller.criarNovaCategoria(categoria: categoria);
              controller.setImage(null);
            }
          },
          child: const Text('Criar'),
        ),
      ],
    );
  }

  Future<String?> abrirSeletorDeImagens() async {
    return await showModalBottomSheet<String?>(
      context: context,
      builder: (context) {
        return SeletorImagens();
      },
    );
  }
}
