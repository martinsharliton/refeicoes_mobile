import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../core/dio_failure.dart';
import '../../core/exceptions/failure.dart';
import '../../models/categoria_response_dto.dart';
import 'categoria_repository.dart';

class CategoriaRepositoryImpl implements CategoriaRepository {
  final DioForNative client;

  CategoriaRepositoryImpl(this.client);

  @override
  Future<Result<List<CategoriaResponseDTO>, Failure>> findAll() async {
    try {
      final response = await client.get('categorias');

      log(response.toString());

      if (response.statusCode == 200) {
        final result = (response.data as List).map((categoria) => CategoriaResponseDTO.fromJson(categoria)).toList();
        return Success(result);
      }

      return Error(DioFailure(message: 'Erro ao carregar categorias'));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao carregar categorias'));
    }
  }
}
