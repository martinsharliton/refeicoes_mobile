import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../models/images/imagens.dart';

class SeletorImagens extends StatefulWidget {
  const SeletorImagens({super.key});

  @override
  State<SeletorImagens> createState() => _SeletorImagensState();
}

class _SeletorImagensState extends State<SeletorImagens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 13,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selecione uma Imagem',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
              ),
            ),
            Flexible(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: listaDeImagens.length,
                itemBuilder: (context, index) {
                  final imagem = listaDeImagens[index];
                  return GestureDetector(
                    onTap: () {
                      Modular.to.pop(imagem.url);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(imagem.url, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
