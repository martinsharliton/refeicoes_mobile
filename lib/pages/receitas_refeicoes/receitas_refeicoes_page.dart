import 'package:flutter/material.dart';

import '../../models/receita.dart';
import 'components/item_receita_refeicao.dart';

class ReceitasRefeicoesPage extends StatelessWidget {
  final Receita receita;
  final Color cor;

  const ReceitasRefeicoesPage({super.key, required this.receita, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita.titulo), backgroundColor: cor),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Image.network(
                  width: 849,
                  height: 300,
                  receita.imagemUrl,
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
                    receita.descricao,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Builder(
                  builder: (context) {
                    if (receita.ingredientes.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Nenhum ingrediente disponível para esta receita.', style: TextStyle(fontSize: 16)),
                      );
                    }

                    return ItemReceitaRefeicao(titulo: 'Ingredientes', itens: receita.ingredientes, cor: cor);
                  },
                ),

                Builder(
                  builder: (context) {
                    if (receita.passos.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Nenhum passo disponível para esta receita.', style: TextStyle(fontSize: 16)),
                      );
                    }

                    return ItemReceitaRefeicao(titulo: 'Passos', itens: receita.passos, cor: cor);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
