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
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();
    controller.idRefeicao = receita.id;
    WidgetsBinding.instance.addPostFrameCallback((_) => _setupReactions());
  }

  void _setupReactions() {
    _disposers.addAll([
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
            showSuccess(controller.successMessage ?? 'Sucesso!', fixed: true);
            break;
          case PageStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro!', fixed: true);
            break;
        }
      }),
      when((_) => controller.todasAsListasEstaoVazias, () async {
        await controller.carregarTodosOsDados();
      }),
    ]);
  }

  @override
  void dispose() {
    for (var dispose in _disposers) {
      dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(receita.titulo ?? 'Detalhes')),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                receita.imagemUrl ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 300,
                    color: Colors.grey[300],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image_outlined, size: 100, color: Colors.grey)),
                  );
                },
              ),
              Container(
                width: double.infinity,
                color: Colors.black.withValues(alpha: 0.6),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  receita.descricao ?? 'Sem descrição',
                  style: textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Observer(
            builder: (context) {
              if (controller.todasAsListasEstaoVazias) {
                return Row(
                  children: [
                    Expanded(
                      child: ItemReceitaRefeicao(
                        titulo: 'Ingredientes',
                        controller: controller,
                        itens: controller.listIngredientes,
                      ),
                    ),
                    Expanded(
                      child: ItemReceitaRefeicao(
                        titulo: 'Passos',
                        controller: controller,
                        itens: controller.listPassos,
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  ItemReceitaRefeicao(
                    titulo: 'Ingredientes',
                    controller: controller,
                    itens: controller.listIngredientes,
                  ),
                  ItemReceitaRefeicao(titulo: 'Passos', controller: controller, itens: controller.listPassos),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
