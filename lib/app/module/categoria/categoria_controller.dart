import 'package:mobx/mobx.dart';

import '../../core/api_handler.dart';
import '../../core/page_status.dart';
import '../../models/categoria/categoria_model.dart';
import '../../models/categoria/categoria_response_dto.dart';
import '../../repository/categoria/categoria_repository.dart';

part 'categoria_controller.g.dart';

class CategoriaController = CategoriaControllerBase with _$CategoriaController;

abstract class CategoriaControllerBase with Store {
  final CategoriaRepository categoriaRepository;

  @readonly
  var _listCategorias = ObservableList<CategoriaResponseDTO>();

  @readonly
  var _status = PageStatus.initial;

  @readonly
  String? _successMessage;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagemSelecionada;

  @readonly
  bool _imagemError = false;

  CategoriaControllerBase(this.categoriaRepository);

  @action
  Future<void> loadingListCategorias() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      categoriaRepository.findAll(),
      onSuccess: (result) async {
        _listCategorias.clear();
        _listCategorias.addAll(result);
        _status = PageStatus.loaded;
      },
      onError: (message) {
        _errorMessage = message;
        _status = PageStatus.error;
      },
    );
  }

  @action
  Future<void> criarNovaCategoria({required CategoriaModel categoria}) async {
    _errorMessage = null;
    _successMessage = null;

    await handleApiCall(
      categoriaRepository.createCategoria(categoria: categoria),
      onSuccess: (result) async {
        _listCategorias.add(result);
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
