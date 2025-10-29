import 'package:multiple_result/multiple_result.dart';

import '../../core/exceptions/failure.dart';
import '../../models/receita/receita_model.dart';
import '../../models/receita/receita_response_dto.dart';

abstract class RefeicaoCategoriaRepository {
  Future<Result<List<ReceitaResponseDTO>, Failure>> findAll({required int idCategoria});
  Future<Result<ReceitaResponseDTO, Failure>> createReceita({required ReceitaModel receita, required int idCategoria});
  Future<Result<bool, Failure>> deleteRefeicao({required int idRefeicao});

  Future<Result<List<String>, Failure>> findAllIngredientes({required int idRefeicao});
  Future<Result<List<String>, Failure>> findAllPassos({required int idRefeicao});

  Future<Result<List<String>, Failure>> createIngredientesReceita({required int idRefeicao, required String item});
  Future<Result<List<String>, Failure>> createPassosReceita({required int idRefeicao, required String item});

  Future<Result<List<String>, Failure>> deleteIngredientesReceita({required int idRefeicao, required String item});
  Future<Result<List<String>, Failure>> deletePassosReceita({required int idRefeicao, required String item});
}
