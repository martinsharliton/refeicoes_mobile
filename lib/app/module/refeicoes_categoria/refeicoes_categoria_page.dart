import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/loader.dart';
import '../../core/messages.dart';
import '../../core/page_status.dart';
import '../../models/categoria/categoria_response_dto.dart';
import 'components/adicionar_refeicao_categoria_dialog.dart';
import 'components/item_refeicoes.dart';
import 'refeicoes_categoria_controller.dart';

class RefeicoesCategoriaPage extends StatefulWidget {
  final CategoriaResponseDTO categoria;
  const RefeicoesCategoriaPage({super.key, required this.categoria});

  @override
  State<RefeicoesCategoriaPage> createState() => _RefeicoesCategoriaPageState();
}

class _RefeicoesCategoriaPageState extends State<RefeicoesCategoriaPage> with Loader, Messages {
  final controller = Modular.get<RefeicoesCategoriaController>();
  CategoriaResponseDTO get categoria => widget.categoria;
  List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _setupReactions());
    super.initState();
  }

  Future<void> _setupReactions() async {
    controller.idCategoria = categoria.id;

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
      when((_) => controller.listReceitas.isEmpty, () async {
        await controller.carregarReceitas();
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
      appBar: AppBar(title: Text(categoria.titulo ?? '-')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Observer(
          builder: (context) {
            if (controller.listReceitas.isEmpty && controller.status == PageStatus.loaded) {
              return Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Nenhuma receita disponível para a categoria\n${categoria.titulo ?? ''}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  categoria.descricao ?? '-',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Flexible(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.carregarReceitas();
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 100),
                      itemCount: controller.listReceitas.length,
                      itemBuilder: (context, index) {
                        final receita = controller.listReceitas[index];
                        return ItemRefeicoes(receita: receita, controller: controller);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Nova Refeição'),
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AdicionarRefeicaoCategoriaDialog(controller: controller);
            },
          );
        },
      ),
    );
  }
}
