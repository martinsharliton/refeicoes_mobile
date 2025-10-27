import 'package:flutter/material.dart';

import '../../../config/theme/ui/colors_app.dart';

class ItemReceitaRefeicao extends StatelessWidget {
  final List<String> itens;
  final String titulo;

  const ItemReceitaRefeicao({super.key, required this.itens, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final cor = context.colors.primary;

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
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.restaurant_menu_rounded, color: cor, size: 20),
              title: Text(
                titulo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cor, height: 1.2),
              ),
              subtitle: Text(
                '${itens.length} ${itens.length == 1 ? 'item' : 'itens'}',
                style: TextStyle(fontSize: 13, color: cor.withValues(alpha: 0.7), fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: itens.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == itens.length - 1;

                  return Row(
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: !isLast
                                ? Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1.5))
                                : null,
                          ),
                          child: Material(
                            color: Colors.transparent,
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

                      Visibility(
                        visible: isLast,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: context.colors.secondary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.remove, color: Colors.white),
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
