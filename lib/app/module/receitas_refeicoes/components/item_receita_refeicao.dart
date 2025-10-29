import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../config/theme/ui/text_styles.dart';
import '../receitas_refeicoes_controller.dart';
import 'adicionar_item_dialog.dart';
import 'remover_item_dialog.dart';

class ItemReceitaRefeicao extends StatefulWidget {
  final ReceitasRefeicoesController controller;
  final List<String> itens;
  final String titulo;
  const ItemReceitaRefeicao({super.key, required this.itens, required this.titulo, required this.controller});

  @override
  State<ItemReceitaRefeicao> createState() => _ItemReceitaRefeicaoState();
}

class _ItemReceitaRefeicaoState extends State<ItemReceitaRefeicao> {
  ReceitasRefeicoesController get controller => widget.controller;
  String get titulo => widget.titulo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final Color sectionColor = colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: sectionColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: sectionColor.withValues(alpha: 0.3), width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: Icon(
                      titulo == 'Ingredientes' ? Icons.kitchen_outlined : Icons.format_list_numbered_rounded,
                      color: sectionColor,
                      size: 24,
                    ),
                    title: Text(
                      titulo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(color: sectionColor, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${widget.itens.length} ${widget.itens.length == 1 ? 'item' : 'itens'}',
                      style: textTheme.titleMedium?.copyWith(color: sectionColor.withValues(alpha: 0.7)),
                    ),
                  ),
                ),
                // Botão Adicionar (+)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onSecondary,
                    ),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      abrirAdicionarItemDialog(titulo: titulo);
                    },
                    tooltip: 'Adicionar ${titulo.toLowerCase()}',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: widget.itens.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == widget.itens.length - 1;

                  return Dismissible(
                    key: Key('${titulo}_${item}_$index'),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      controller.item = item;

                      final bool? confirmar = await _abrirRemoverItemDialog(item: controller.item ?? item);

                      if (confirmar != null && confirmar == true) {
                        if (titulo == 'Ingredientes') {
                          await deleteIngrediente();
                        } else {
                          await deletePasso();
                        }

                        return confirmar;
                      }

                      return false;
                    },
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade800,
                        borderRadius: index == 0 && isLast
                            ? BorderRadius.circular(12)
                            : index == 0
                            ? const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                            : isLast
                            ? const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                            : BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Remover', style: context.textStyles.textTitleItemList.copyWith(color: Colors.white)),
                          const SizedBox(width: 8),
                          Icon(Icons.delete_outline, color: Colors.white, size: 22),
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: !isLast ? Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)) : null,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: sectionColor.withValues(alpha: 0.1),
                          radius: 18,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        title: Text(item, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Abre o dialog de confirmação para remover item
  Future<bool?> _abrirRemoverItemDialog({required String item}) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return RemoverItemDialog(item: item, titulo: titulo);
      },
    );
  }

  // Abre o dialog para adicionar um novo item (VOCÊ PRECISA CRIAR ESTE WIDGET)
  Future<void> abrirAdicionarItemDialog({required String titulo}) async {
    log('Criar $titulo');

    final result = await showDialog<Object>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AdicionarItemDialog();
      },
    );

    if ((result != null) && (result is String) && (result).isNotEmpty) {
      controller.item = result.toString();
      log('Criar ${result.toString()}');

      if (titulo == 'Ingredientes') {
        controller.adicionarIngrediente();
      } else {
        controller.adicionarPasso();
      }

      return;
    }

    log('Deu erro em algo');
  }

  Future<void> deleteIngrediente() async {
    controller.deletarIngredientesReceitas();
  }

  Future<void> deletePasso() async {
    controller.deletarPassosReceitas();
  }
}
