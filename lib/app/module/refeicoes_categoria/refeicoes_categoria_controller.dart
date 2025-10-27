import 'package:mobx/mobx.dart';

import '../../core/api_handler.dart';
import '../../core/page_status.dart';
import '../../enumeration/dificuldade.dart';
import '../../models/receita/receita_model.dart';
import '../../models/receita/receita_response_dto.dart';
import '../../repository/refeicao_categoria/refeicao_categoria_repository.dart';

part 'refeicoes_categoria_controller.g.dart';

class RefeicoesCategoriaController = RefeicoesCategoriaControllerBase with _$RefeicoesCategoriaController;

abstract class RefeicoesCategoriaControllerBase with Store {
  final RefeicaoCategoriaRepository receitaRepository;

  int? idCategoria;

  @readonly
  var _listReceitas = ObservableList<ReceitaResponseDTO>();

  @readonly
  var _status = PageStatus.initial;

  @readonly
  String? _successMessage;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagemSelecionada;

  @readonly
  String _difuculdade = Dificuldade.facil.descricao;

  @readonly
  bool _imagemError = false;

  RefeicoesCategoriaControllerBase(this.receitaRepository);

  @action
  Future<void> criarNovaReceita({required ReceitaModel receita}) async {
    _errorMessage = null;
    _successMessage = null;

    await handleApiCall(
      receitaRepository.createReceita(idCategoria: idCategoria ?? 0, receita: receita),
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

  @action
  Future<void> carregarReceitas() async {
    _errorMessage = null;
    _successMessage = null;

    await handleApiCall(
      receitaRepository.findAll(idCategoria: idCategoria ?? 0),
      onSuccess: (result) async {
        _listReceitas.clear();
        _listReceitas.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  void setImage(String? image) {
    _imagemSelecionada = image;
  }

  @action
  void setImageError(bool value) {
    _imagemError = value;
  }
}
