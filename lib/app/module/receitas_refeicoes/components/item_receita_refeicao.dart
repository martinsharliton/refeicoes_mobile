import 'package:flutter/material.dart';

import '../../../config/theme/ui/colors_app.dart';
import '../../../config/theme/ui/text_styles.dart';

class ItemReceitaRefeicao extends StatefulWidget {
  final List<String> itens;
  final String titulo;

  const ItemReceitaRefeicao({super.key, required this.itens, required this.titulo});

  @override
  State<ItemReceitaRefeicao> createState() => _ItemReceitaRefeicaoState();
}

class _ItemReceitaRefeicaoState extends State<ItemReceitaRefeicao> {
  Color get cor => context.colors.primary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: cor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: cor.withValues(alpha: 0.5), width: 1),
            ),
            child: Row(
              children: [
                Flexible(
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: Icon(Icons.restaurant_menu_rounded, color: cor, size: 20),
                    title: Text(
                      widget.titulo,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cor, height: 1.2),
                    ),
                    subtitle: Text(
                      '${widget.itens.length} ${widget.itens.length == 1 ? 'item' : 'itens'}',
                      style: TextStyle(fontSize: 13, color: cor.withValues(alpha: 0.7), fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: context.colors.secondary, borderRadius: BorderRadius.circular(50)),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: widget.itens.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == widget.itens.length - 1;

                  return Row(
                    children: [
                      Flexible(
                        child: Dismissible(
                          confirmDismiss: (direction) async {
                            return null;
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red.shade700,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Remover',
                                    style: context.textStyles.textTitleItemList.copyWith(color: Colors.white),
                                  ),
                                  Icon(Icons.delete, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          key: Key(item),
                          child: Container(
                            decoration: BoxDecoration(
                              border: !isLast
                                  ? Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1.5))
                                  : null,
                            ),
                            child: ListTile(
                              splashColor: cor.withValues(alpha: 0.1),
                              leading: CircleAvatar(
                                backgroundColor: cor.withValues(alpha: 0.15),
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: cor),
                                ),
                              ),
                              title: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
