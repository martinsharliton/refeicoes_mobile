import 'package:flutter/material.dart';

class ItemReceitaRefeicao extends StatelessWidget {
  final List<String> itens;
  final String titulo;
  final Color cor;

  const ItemReceitaRefeicao({super.key, required this.itens, required this.titulo, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.15),
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.restaurant_menu_rounded, color: Colors.black, size: 20),
              title: Text(
                titulo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black, height: 1.2),
              ),
              subtitle: Text(
                '${itens.length} ${itens.length == 1 ? 'item' : 'itens'}',
                style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            child: Column(
              children: itens.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isLast = index == itens.length - 1;

                return Container(
                  decoration: BoxDecoration(
                    border: !isLast ? Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1.5)) : null,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.black.withValues(alpha: 0.1),
                      highlightColor: Colors.black.withValues(alpha: 0.05),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black.withValues(alpha: 0.15),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
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
                        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 20),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
