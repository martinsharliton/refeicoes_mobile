import 'dart:developer';

import 'package:dio/dio.dart';

import 'env.dart';

class AuthInterceptor extends Interceptor {
  final Dio dioRefreshToken = Dio(
    BaseOptions(
      baseUrl: Env.apiURL,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 90),
      sendTimeout: const Duration(seconds: 90),
      receiveDataWhenStatusError: true,
      validateStatus: (status) => status != null && status < 500,
    ),
  );
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log('/ "${options.uri}"', name: options.method);

    // CORREÇÃO: Libere a requisição para continuar!
    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    log('[onError] /"${err.requestOptions.uri}"', name: err.requestOptions.method);

    // CORREÇÃO: Libere o erro para continuar!
    return handler.next(err);
  }
}
