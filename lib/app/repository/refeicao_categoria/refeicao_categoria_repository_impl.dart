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

      return Error(DioFailure(message: response.data['message'] as String));
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

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar uma receita'));
    }
  }

  @override
  Future<Result<bool, Failure>> deleteRefeicao({required int idRefeicao}) async {
    try {
      final response = await client.delete('receitas/$idRefeicao');

      if (response.statusCode == 204) {
        return Success(true);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao carregar receitas'));
    }
  }

  @override
  Future<Result<List<String>, Failure>> findAllIngredientes({required int idRefeicao}) async {
    try {
      final response = await client.get('receitas/$idRefeicao/ingredientes');

      if (response.statusCode == 200) {
        final result = List<String>.from(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao carregar receitas'));
    }
  }

  @override
  Future<Result<List<String>, Failure>> findAllPassos({required int idRefeicao}) async {
    try {
      final response = await client.get('receitas/$idRefeicao/passos');

      if (response.statusCode == 200) {
        final result = List<String>.from(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao carregar receitas'));
    }
  }

  @override
  Future<Result<List<String>, Failure>> createIngredientesReceita({
    required int idRefeicao,
    required String item,
  }) async {
    try {
      final response = await client.post('receitas/$idRefeicao/ingredientes', data: {'item': item});

      if (response.statusCode == 200) {
        final result = List<String>.from(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar ingrediante'));
    }
  }

  @override
  Future<Result<List<String>, Failure>> createPassosReceita({required int idRefeicao, required String item}) async {
    try {
      final response = await client.post('receitas/$idRefeicao/passos', data: {'item': item});

      if (response.statusCode == 200) {
        final result = List<String>.from(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar passo'));
    }
  }

  @override
  Future<Result<List<String>, Failure>> deleteIngredientesReceita({
    required int idRefeicao,
    required String item,
  }) async {
    try {
      final response = await client.delete('receitas/$idRefeicao/ingredientes', data: {'item': item});

      if (response.statusCode == 200) {
        final result = List<String>.from(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar passo'));
    }
  }

  @override
  Future<Result<List<String>, Failure>> deletePassosReceita({required int idRefeicao, required String item}) async {
    try {
      final response = await client.delete('receitas/$idRefeicao/passos', data: {'item': item});

      if (response.statusCode == 200) {
        final result = List<String>.from(response.data);
        return Success(result);
      }

      return Error(DioFailure(message: response.data['message'] as String));
    } on DioException catch (_) {
      return Error(DioFailure(message: 'Erro ao adicionar passo'));
    }
  }
}
