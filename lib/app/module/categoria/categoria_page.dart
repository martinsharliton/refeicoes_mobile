import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/loader.dart';
import '../../core/messages.dart';
import '../../core/page_status.dart';
import '../../core/refresh_data_page.dart';
import 'categoria_controller.dart';
import 'components/adicionar_categoria_dialog.dart';
import 'components/item_categoria.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({super.key});

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> with Loader, Messages {
  final controller = Modular.get<CategoriaController>();
  List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _initializeVariables();
    WidgetsBinding.instance.addPostFrameCallback((_) => _setupReactions());
    super.initState();
  }

  void _initializeVariables() {}

  Future<void> _setupReactions() async {
    _disposers = [
      reaction((_) => controller.status, (status) {
        switch (status) {
          case PageStatus.initial:
            break;
          case PageStatus.loading:
            showLoader();
            break;
          case PageStatus.loaded:
            hideLoader();
            break;
          case PageStatus.success:
            hideLoader();
            showSuccess(controller.successMessage ?? '', fixed: true);
            break;
          case PageStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? '', fixed: true);
            break;
        }
      }),
      when((_) => controller.listCategorias.isEmpty, () async {
        await controller.loadingListCategorias();
      }),
    ];
  }

  @override
  void dispose() {
    _disposeReactions();
    super.dispose();
  }

  void _disposeReactions() {
    for (var dispose in _disposers) {
      dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minhas Receitas')),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(title: const Text('Navegação'), automaticallyImplyLeading: false, backgroundColor: Colors.black87),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Categorias'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.listCategorias.isEmpty) {
            return RefreshDataPage(
              onPressed: () {
                controller.loadingListCategorias();
              },
              title: 'Nenhuma categoria encontrada',
              subtitle: 'Toque para tentar novamente.',
            );
          }

          return GridView(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 50),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.5,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: controller.listCategorias.map((categoria) {
              return ItemCategoria(categoria: categoria);
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AdicionarCategoriaDialog(controller: controller);
            },
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
