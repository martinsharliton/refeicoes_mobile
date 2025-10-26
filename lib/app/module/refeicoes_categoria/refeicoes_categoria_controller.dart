import 'package:mobx/mobx.dart';

import '../../core/api_handler.dart';
import '../../core/page_status.dart';
import '../../models/receita/receita_model.dart';
import '../../models/receita/receita_response_dto.dart';
import '../../repository/refeicao_categoria/refeicao_categoria_repository.dart';

part 'refeicoes_categoria_controller.g.dart';

class RefeicoesCategoriaController = RefeicoesCategoriaControllerBase with _$RefeicoesCategoriaController;

abstract class RefeicoesCategoriaControllerBase with Store {
  final RefeicaoCategoriaRepository receitaRepository;

  @readonly
  var _listReceitas = ObservableList<ReceitaResponseDTO>();

  @readonly
  var _status = PageStatus.initial;

  @readonly
  String? _successMessage;

  @readonly
  String? _errorMessage;

  RefeicoesCategoriaControllerBase(this.receitaRepository);

  @action
  Future<void> criarNovaReceita({required ReceitaModel receita}) async {
    _errorMessage = null;
    _successMessage = null;

    await handleApiCall(
      receitaRepository.createReceita(idCategoria: 0, receita: receita),
      onSuccess: (result) async {
        _listReceitas.add(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }
}
