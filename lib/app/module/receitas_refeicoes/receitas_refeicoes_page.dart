import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/loader.dart';
import '../../core/messages.dart';
import '../../core/page_status.dart';
import '../../models/receita/receita_response_dto.dart';
import 'components/item_receita_refeicao.dart';
import 'receitas_refeicoes_controller.dart';

class ReceitasRefeicoesPage extends StatefulWidget {
  final ReceitaResponseDTO receita;

  const ReceitasRefeicoesPage({super.key, required this.receita});

  @override
  State<ReceitasRefeicoesPage> createState() => _ReceitasRefeicoesPageState();
}

class _ReceitasRefeicoesPageState extends State<ReceitasRefeicoesPage> with Loader, Messages {
  final controller = Modular.get<ReceitasRefeicoesController>();
  ReceitaResponseDTO get receita => widget.receita;

  List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _setupReactions());
    super.initState();
  }

  Future<void> _setupReactions() async {
    controller.idRefeicao = receita.id;

    _disposers = [
      reaction((_) => controller.status, (status) {
        switch (status) {
          case PageStatus.initial:
            break;
          case PageStatus.loading:
            showLoader();
            break;
          case PageStatus.loaded:
            hideLoader();
            break;
          case PageStatus.success:
            hideLoader();
            showSuccess(controller.successMessage ?? '', fixed: true);
            break;
          case PageStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? '', fixed: true);
            break;
        }
      }),
      when((_) => controller.todasAsListas, () async {
        await controller.carregarTodosOsDados();
      }),
    ];
  }

  @override
  void dispose() {
    _disposeReactions();
    super.dispose();
  }

  void _disposeReactions() {
    for (var dispose in _disposers) {
      dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita.titulo ?? '-')),
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: Image.network(
                  width: 849,
                  height: 300,
                  receita.imagemUrl ?? '-',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 100);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    receita.descricao ?? '-',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Observer(
            builder: (context) {
              if ((controller.listIngredientes.isEmpty) &&
                  (controller.listPassos.isEmpty) &&
                  controller.status == PageStatus.loaded) {
                return Center(
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Nenhum item disponível para esta receita.', style: TextStyle(fontSize: 16)),
                  ),
                );
              }

              return Column(
                children: [
                  Visibility(
                    visible: controller.listIngredientes.isNotEmpty,
                    child: ItemReceitaRefeicao(titulo: 'Ingredientes', itens: controller.listIngredientes),
                  ),
                  Visibility(
                    visible: controller.listPassos.isNotEmpty,
                    child: ItemReceitaRefeicao(titulo: 'Passos', itens: controller.listPassos),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
