import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import 'receitas_refeicoes_page.dart';

class ReceitasRefeicoesModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => ReceitasRefeicoesPage(receita: r.args.data));
  }
}
