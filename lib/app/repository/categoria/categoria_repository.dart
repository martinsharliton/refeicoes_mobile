import 'package:multiple_result/multiple_result.dart';

import '../../core/exceptions/failure.dart';
import '../../models/categoria/categoria_model.dart';
import '../../models/categoria/categoria_response_dto.dart';

abstract class CategoriaRepository {
  Future<Result<List<CategoriaResponseDTO>, Failure>> findAll();
  Future<Result<CategoriaResponseDTO, Failure>> createCategoria({required CategoriaModel categoria});
}
