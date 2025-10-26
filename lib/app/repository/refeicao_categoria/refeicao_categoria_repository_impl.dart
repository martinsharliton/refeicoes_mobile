import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../core/dio_failure.dart';
import '../../core/exceptions/failure.dart';
import '../../models/receita/receita_model.dart';
import '../../models/receita/receita_response_dto.dart';
import 'refeicao_categoria_repository.dart';

class RefeicaoCategoriaRepositoryImpl implements RefeicaoCategoriaRepository {
  final DioForNative client;
  RefeicaoCategoriaRepositoryImpl(this.client);

  @override
  Future<Result<List<ReceitaResponseDTO>, Failure>> findAll({required int idCategoria}) async {
    try {
      final response = await client.get('categorias/$idCategoria/receitas');

      if (response.statusCode == 200) {
        final result = (response.data as List).map((categoria) => ReceitaResponseDTO.fromJson(categoria)).toList();
        return Success(result);
      }

      return Error(DioFailure(message: 'Erro ao carregar receitas'));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao carregar receitas'));
    }
  }

  @override
  Future<Result<ReceitaResponseDTO, Failure>> createReceita({
    required ReceitaModel receita,
    required int idCategoria,
  }) async {
    try {
      final response = await client.post('categorias/$idCategoria/receitas', data: receita.toJson());

      if (response.statusCode == 201) {
        final result = ReceitaResponseDTO.fromJson(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: 'Erro ao adicionar uma receita'));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar uma receita'));
    }
  }
}
