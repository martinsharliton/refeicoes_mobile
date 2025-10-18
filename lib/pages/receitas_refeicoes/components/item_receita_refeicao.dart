import 'package:flutter/material.dart';

class ItemReceitaRefeicao extends StatelessWidget {
  final List<String> itens;
  final String titulo;
  final Color cor;

  const ItemReceitaRefeicao({super.key, required this.itens, required this.titulo, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: cor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: cor, width: 1),
            ),
            child: ListTile(
              dense: true,
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4)),
                BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 4, offset: const Offset(0, 2)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: itens.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == itens.length - 1;

                  return Container(
                    decoration: BoxDecoration(
                      border: !isLast ? Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1.5)) : null,
                      gradient: index % 2 == 0
                          ? LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.white, Colors.grey.shade50],
                            )
                          : null,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        splashColor: cor.withValues(alpha: 0.1),
                        highlightColor: cor.withValues(alpha: 0.05),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Número do item
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: cor.withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: cor.withValues(alpha: 0.3), width: 1.5),
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: cor),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Texto do item
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.4,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 4,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: cor.withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Ícone de ação
                              Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 20),
                            ],
                          ),
                        ),
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
}
