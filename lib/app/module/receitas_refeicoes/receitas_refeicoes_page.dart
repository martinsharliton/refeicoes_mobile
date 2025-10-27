import 'package:flutter/material.dart';

import '../../models/receita/receita_response_dto.dart';
import 'components/item_receita_refeicao.dart';

class ReceitasRefeicoesPage extends StatelessWidget {
  final ReceitaResponseDTO receita;

  const ReceitasRefeicoesPage({super.key, required this.receita});

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
          Builder(
            builder: (context) {
              if (receita.ingredientes?.isEmpty ?? true) {
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Nenhum ingrediente disponível para esta receita.', style: TextStyle(fontSize: 16)),
                );
              }

              return ItemReceitaRefeicao(titulo: 'Ingredientes', itens: receita.ingredientes ?? []);
            },
          ),

          Builder(
            builder: (context) {
              if (receita.passos?.isEmpty ?? true) {
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Nenhum passo disponível para esta receita.', style: TextStyle(fontSize: 16)),
                );
              }

              return ItemReceitaRefeicao(titulo: 'Passos', itens: receita.passos ?? []);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar nova categoria
        },
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
