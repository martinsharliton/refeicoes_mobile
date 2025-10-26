import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../models/categoria/categoria_response_dto.dart';
import 'opcoes_categoria_bootom_sheet.dart';

class ItemCategoria extends StatefulWidget {
  final CategoriaResponseDTO categoria;

  const ItemCategoria({required this.categoria, super.key});

  @override
  State<ItemCategoria> createState() => _ItemCategoriaState();
}

class _ItemCategoriaState extends State<ItemCategoria> {
  CategoriaResponseDTO get categoria => widget.categoria;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        abrirTelaRefeicaoCategoria();
      },
      onDoubleTap: () {
        abrirOpcoesCategoriaBootomSheet();
      },
      onLongPress: () {
        abrirOpcoesCategoriaBootomSheet();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(categoria.imagemUrl ?? '-'), fit: BoxFit.cover, opacity: 0.9),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Text(
            widget.categoria.titulo ?? '-',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void abrirTelaRefeicaoCategoria() {
    Modular.to.pushNamed(routeRefeicaoCategoria, arguments: categoria);
  }

  void abrirOpcoesCategoriaBootomSheet() async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return OpcoesCategoriaBootomSheet(categoria: categoria);
      },
    );
  }
}
