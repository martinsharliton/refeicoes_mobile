import 'package:flutter_modular/flutter_modular.dart';

import 'inicializar_app_page.dart';

class InicializarAppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const InicializarAppPage());
  }
}
