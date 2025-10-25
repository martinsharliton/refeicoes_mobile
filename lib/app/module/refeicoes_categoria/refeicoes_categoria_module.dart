import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import 'refeicoes_categoria_controller.dart';
import 'refeicoes_categoria_page.dart';

class RefeicoesCategoriaModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addSingleton(RefeicoesCategoriaController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => RefeicoesCategoriaPage(categoria: r.args.data));
  }
}
