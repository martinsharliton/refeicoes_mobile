import 'package:flutter_modular/flutter_modular.dart';

import 'module/categoria/categoria_module.dart';
import 'module/core/core_module.dart';
import 'module/inicializar_app/inicializar_app_module.dart';
import 'module/refeicoes_categoria/refeicoes_categoria_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: InicializarAppModule());
    r.module(routeCategoria, module: CategoriaModule());
    r.module(routeRefeicaoCategoria, module: RefeicoesCategoriaModule());
  }
}

const routeCategoria = '/categoria/';
const routeRefeicaoCategoria = '/refeicao-ategoria/';
