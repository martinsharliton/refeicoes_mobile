import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../models/images/imagens.dart';
import '../categoria_controller.dart';

class AdicionarCategoriaDialog extends StatefulWidget {
  final CategoriaController controller;
  const AdicionarCategoriaDialog({super.key, required this.controller});

  @override
  State<AdicionarCategoriaDialog> createState() => _AdicionarCategoriaDialogState();
}

class _AdicionarCategoriaDialogState extends State<AdicionarCategoriaDialog> {
  CategoriaController get controller => widget.controller;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  String? _imagemUrlSelecionada;
  bool _imagemError = false; // Para validação da imagem

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Categoria', textAlign: TextAlign.center),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        // Envolvemos a Coluna em um Form
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- CAMPO DE TÍTULO ---
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Nome da Categoria'),
                validator: Validatorless.required('O nome da categoria é obrigatório'),
              ),
              const SizedBox(height: 10),

              // --- CAMPO DE DESCRIÇÃO ---
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição da Categoria'),
                validator: Validatorless.required('A descrição da categoria é obrigatória'),
              ),
              const SizedBox(height: 20),

              // --- 3. PREVIEW DA IMAGEM SELECIONADA ---
              if (_imagemUrlSelecionada != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(_imagemUrlSelecionada!, height: 150, width: double.infinity, fit: BoxFit.cover),
                ),

              // --- MENSAGEM DE ERRO DA IMAGEM ---
              if (_imagemError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Por favor, selecione uma imagem',
                    style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                  ),
                ),

              Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: _abrirSeletorDeImagens,
                    child: Text(_imagemUrlSelecionada == null ? 'Selecionar Imagem' : 'Alterar Imagem'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        // Botão de Cancelar
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        // Botão de Adicionar (com validação)
        ElevatedButton(onPressed: _adicionarCategoria, child: const Text('Adicionar')),
      ],
    );
  }

  // --- 4. FUNÇÃO PARA ABRIR O BOTTOMSHEET ---
  void _abrirSeletorDeImagens() {
    // Usamos showModalBottomSheet para um efeito visual melhor
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Um GridView com as imagens
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 13,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Selecione uma Imagem', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20)),
                ),
                Flexible(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: listaDeImagens.length,
                    itemBuilder: (context, index) {
                      final imagem = listaDeImagens[index];
                      return GestureDetector(
                        onTap: () {
                          // Ao selecionar, atualiza o estado e fecha o sheet
                          setState(() {
                            _imagemUrlSelecionada = imagem.url;
                            _imagemError = false; // Limpa o erro
                          });
                          Navigator.of(context).pop();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(imagem.url, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- 5. FUNÇÃO PARA VALIDAR E ADICIONAR ---
  void _adicionarCategoria() {
    // Valida os campos de texto
    final formIsValid = _formKey.currentState?.validate() ?? false;
    // Valida a imagem
    final imageIsValid = _imagemUrlSelecionada != null;

    if (!imageIsValid) {
      setState(() {
        _imagemError = true;
      });
    }

    // Se ambos forem válidos, chama o controller
    if (formIsValid && imageIsValid) {
      //
      // CHAME SEU CONTROLLER AQUI
      // controller.adicionarCategoria(
      //   titulo: _tituloController.text,
      //   descricao: _descricaoController.text,
      //   imagemUrl: _imagemUrlSelecionada!,
      // );
      //

      // Fecha o dialog
      Navigator.of(context).pop();
    }
  }
}
