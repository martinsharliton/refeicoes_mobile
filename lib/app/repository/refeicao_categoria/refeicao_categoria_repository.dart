import 'package:multiple_result/multiple_result.dart';

import '../../core/exceptions/failure.dart';
import '../../models/receita/receita_model.dart';
import '../../models/receita/receita_response_dto.dart';

abstract class RefeicaoCategoriaRepository {
  Future<Result<List<ReceitaResponseDTO>, Failure>> findAll({required int idCategoria});
  Future<Result<ReceitaResponseDTO, Failure>> createReceita({required ReceitaModel receita, required int idCategoria});
}
