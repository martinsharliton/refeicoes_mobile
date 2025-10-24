import 'package:mobx/mobx.dart';

import '../../core/api_handler.dart';
import '../../core/page_status.dart';
import '../../models/categoria/categoria_response_dto.dart';
import '../../repository/categoria/categoria_repository.dart';

part 'categoria_controller.g.dart';

class CategoriaController = CategoriaControllerBase with _$CategoriaController;

abstract class CategoriaControllerBase with Store {
  final CategoriaRepository categoria;

  @readonly
  var _listCategorias = ObservableList<CategoriaResponseDTO>();

  @readonly
  var _status = PageStatus.initial;

  @readonly
  String? _successMessage;

  @readonly
  String? _errorMessage;

  CategoriaControllerBase(this.categoria);

  @action
  Future<void> loadingListCategorias() async {
    _errorMessage = null;
    _successMessage = null;
    _status = PageStatus.loading;

    await handleApiCall(
      categoria.findAll(),
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
}
