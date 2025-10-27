import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../config/exetension/extension.dart';
import '../../../config/theme/components/seletor_imagens.dart';
import '../../../enumeration/dificuldade.dart';
import '../../../models/receita/receita_model.dart';
import '../refeicoes_categoria_controller.dart';

class AdicionarRefeicaoCategoriaDialog extends StatefulWidget {
  final RefeicoesCategoriaController controller;
  const AdicionarRefeicaoCategoriaDialog({super.key, required this.controller});

  @override
  State<AdicionarRefeicaoCategoriaDialog> createState() => _AdicionarRefeicaoCategoriaDialogState();
}

class _AdicionarRefeicaoCategoriaDialogState extends State<AdicionarRefeicaoCategoriaDialog> {
  RefeicoesCategoriaController get controller => widget.controller;
  String? get imagemSelecionada => controller.imagemSelecionada;
  bool get imagemError => controller.imagemError;

  late GlobalKey<FormState> formKey;
  late TextEditingController tituloTEC;
  late TextEditingController descricaoTEC;
  late TextEditingController tempoPreparoTEC;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    tituloTEC = TextEditingController();
    descricaoTEC = TextEditingController();
    tempoPreparoTEC = TextEditingController();
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
      title: const Text('Nova Refeição'),
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
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: Validatorless.required('Nome é obrigatório'),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  maxLines: 3,
                  controller: descricaoTEC,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(labelText: 'Descrição', alignLabelWithHint: true),
                  validator: Validatorless.required('Descrição é obrigatória'),
                ),

                const SizedBox(height: 10),

                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tempoPreparoTEC,
                        keyboardType: TextInputType.number,
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        decoration: const InputDecoration(labelText: 'Tempo de Preparo', alignLabelWithHint: true),
                        validator: Validatorless.required('Tempo de Preparo é brigatório'),
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: Dificuldade.facil.descricao,
                        items: Dificuldade.values.map((dificuldade) {
                          return DropdownMenuItem<String>(
                            value: dificuldade.descricao,
                            child: Text(dificuldade.name.capitalize()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          log(value.toString());
                        },
                      ),
                    ),
                  ],
                ),

                if (imagemSelecionada != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(imagemSelecionada!, height: 150, width: double.infinity, fit: BoxFit.cover),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    spacing: 5,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final imageURL = await abrirSeletorDeImagens();

                          if (imageURL != null) {
                            controller.setImage(imageURL);
                            controller.setImageError(false);
                          }
                        },
                        child: Icon(Icons.public),
                      ),
                      ElevatedButton(onPressed: () async {}, child: Icon(Icons.camera_alt)),
                    ],
                  ),
                ),

                Visibility(
                  visible: imagemError,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Por favor, selecione uma imagem',
                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
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
            await salvarRefeicaoCategoria();
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

  Future<void> salvarRefeicaoCategoria() async {
    FocusScope.of(context).unfocus();

    final formIsValid = formKey.currentState?.validate() ?? false;
    final imageIsValid = controller.imagemSelecionada != null;

    if (!imageIsValid) {
      controller.setImageError(true);
    }

    if (formIsValid && imageIsValid) {
      Modular.to.pop();

      final receita = ReceitaModel();
      receita.titulo = tituloTEC.text;
      receita.descricao = descricaoTEC.text;
      receita.tempoPreparo = int.tryParse(tempoPreparoTEC.text) ?? 5;
      receita.imagemUrl = controller.imagemSelecionada;
      receita.dificuldade = controller.difuculdade;

      await controller.criarNovaReceita(receita: receita);

      controller.setImage(null);
    }
  }
}
