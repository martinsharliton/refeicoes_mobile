import 'package:mobx/mobx.dart';

import '../../core/api_handler.dart';
import '../../core/page_status.dart';
import '../../repository/refeicao_categoria/refeicao_categoria_repository.dart';

part 'receitas_refeicoes_controller.g.dart';

class ReceitasRefeicoesController = ReceitasRefeicoesControllerBase with _$ReceitasRefeicoesController;

abstract class ReceitasRefeicoesControllerBase with Store {
  final RefeicaoCategoriaRepository receitaRepository;

  int? idRefeicao;

  String? item;

  @readonly
  var _listIngredientes = ObservableList<String>();

  @readonly
  var _listPassos = ObservableList<String>();

  @readonly
  var _status = PageStatus.initial;

  @readonly
  String? _successMessage;

  @readonly
  String? _errorMessage;

  ReceitasRefeicoesControllerBase(this.receitaRepository);

  @action
  Future<void> carregarPassosReceitas() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      receitaRepository.findAllPassos(idRefeicao: idRefeicao ?? 0),
      onSuccess: (result) async {
        _listPassos.clear();
        _listPassos.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> carregarIngredientesReceitas() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      receitaRepository.findAllIngredientes(idRefeicao: idRefeicao ?? 0),
      onSuccess: (result) async {
        _listIngredientes.clear();
        _listIngredientes.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> deletarPassosReceitas() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      receitaRepository.deletePassosReceita(idRefeicao: idRefeicao ?? 0, item: item ?? '-'),
      onSuccess: (result) async {
        _listPassos.clear();
        _listPassos.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> deletarIngredientesReceitas() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      receitaRepository.deleteIngredientesReceita(idRefeicao: idRefeicao ?? 0, item: item ?? '-'),
      onSuccess: (result) async {
        _listIngredientes.clear();
        _listIngredientes.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> adicionarIngrediente() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      receitaRepository.createIngredientesReceita(idRefeicao: idRefeicao ?? 0, item: item ?? '-'),
      onSuccess: (result) async {
        _listIngredientes.clear();
        _listIngredientes.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> adicionarPasso() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      receitaRepository.createPassosReceita(idRefeicao: idRefeicao ?? 0, item: item ?? '-'),
      onSuccess: (result) async {
        _listPassos.clear();
        _listPassos.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> carregarTodosOsDados() async {
    await Future.wait([carregarIngredientesReceitas(), carregarPassosReceitas()]);
  }

  @computed
  bool get todasAsListasEstaoVazias => _listIngredientes.isEmpty && _listPassos.isEmpty;
}
