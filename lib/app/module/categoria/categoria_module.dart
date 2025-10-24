import 'package:flutter_modular/flutter_modular.dart';

import '../../repository/categoria/categoria_repository.dart';
import '../../repository/categoria/categoria_repository_impl.dart';
import '../core/core_module.dart';
import 'categoria_controller.dart';
import 'categoria_page.dart';

class CategoriaModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addSingleton<CategoriaRepository>(CategoriaRepositoryImpl.new);
    i.addSingleton(CategoriaController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => CategoriaPage());
  }
}
