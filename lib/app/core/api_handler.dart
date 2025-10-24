import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';

import 'exceptions/failure.dart';

Future<void> handleApiCall<T>(
  Future<Result<T, Failure>> apiCall, {
  required Function(T success) onSuccess,
  required Function(String errorMessage) onError,
}) async {
  try {
    final result = await apiCall;
    switch (result) {
      case Success():
        onSuccess(result.success);
        break;
      case Error():
        onError(result.error.message ?? 'Erro desconhecido');
        break;
    }
  } catch (e, s) {
    log('Erro durante a chamada de API', error: e, stackTrace: s);
    onError('Erro ao realizar a operação');
  }
}
