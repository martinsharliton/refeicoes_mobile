import 'package:flutter_modular/flutter_modular.dart';

import '../../repository/refeicao_categoria/refeicao_categoria_repository.dart';
import '../../repository/refeicao_categoria/refeicao_categoria_repository_impl.dart';
import '../core/core_module.dart';
import 'receitas_refeicoes_controller.dart';
import 'receitas_refeicoes_page.dart';

class ReceitasRefeicoesModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addSingleton<RefeicaoCategoriaRepository>(RefeicaoCategoriaRepositoryImpl.new);
    i.addSingleton(ReceitasRefeicoesController.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => ReceitasRefeicoesPage(receita: r.args.data));
  }
}
