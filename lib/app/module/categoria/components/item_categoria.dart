import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../models/categoria/categoria_response_dto.dart';
import '../categoria_controller.dart';
import 'opcoes_categoria_bootom_sheet.dart';

class ItemCategoria extends StatefulWidget {
  final CategoriaController controller;
  final CategoriaResponseDTO categoria;

  const ItemCategoria({required this.categoria, super.key, required this.controller});

  @override
  State<ItemCategoria> createState() => _ItemCategoriaState();
}

class _ItemCategoriaState extends State<ItemCategoria> {
  CategoriaController get controller => widget.controller;
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(categoria.imagemUrl ?? '-'), fit: BoxFit.cover),
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

  Future<void> abrirTelaRefeicaoCategoria() async {
    await Modular.to.pushNamed(routeRefeicaoCategoria, arguments: categoria);
    await controller.loadingListCategorias();
  }

  void abrirOpcoesCategoriaBootomSheet() async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return OpcoesCategoriaBootomSheet(categoria: categoria, controller: controller);
      },
    );
  }
}
