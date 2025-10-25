import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../core/dio_failure.dart';
import '../../core/exceptions/failure.dart';
import '../../models/categoria/categoria_model.dart';
import '../../models/categoria/categoria_response_dto.dart';
import 'categoria_repository.dart';

class CategoriaRepositoryImpl implements CategoriaRepository {
  final DioForNative client;

  CategoriaRepositoryImpl(this.client);

  @override
  Future<Result<List<CategoriaResponseDTO>, Failure>> findAll() async {
    try {
      final response = await client.get('categorias');

      if (response.statusCode == 200) {
        final result = (response.data as List).map((categoria) => CategoriaResponseDTO.fromJson(categoria)).toList();
        return Success(result);
      }

      return Error(DioFailure(message: 'Erro ao carregar categorias'));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao carregar categorias'));
    }
  }

  @override
  Future<Result<CategoriaResponseDTO, Failure>> createCategoria({required CategoriaModel categoria}) async {
    try {
      final response = await client.post('categorias', data: categoria.toJson());

      if (response.statusCode == 201) {
        final result = CategoriaResponseDTO.fromJson(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: 'Erro ao adicionar categoria'));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar categoria'));
    }
  }
}
