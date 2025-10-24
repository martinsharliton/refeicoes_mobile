import 'package:multiple_result/multiple_result.dart';

import '../../core/exceptions/failure.dart';
import '../../models/categoria_response_dto.dart';

abstract class CategoriaRepository {
  Future<Result<List<CategoriaResponseDTO>, Failure>> findAll();
}
