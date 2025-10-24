import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'auth_interceptor.dart';
import 'env.dart';

class CustomDio extends DioForNative {
  CustomDio()
    : super(
        BaseOptions(
          baseUrl: Env.apiURL,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 90),
          sendTimeout: const Duration(seconds: 90),
          receiveDataWhenStatusError: true,
        ),
      ) {
    interceptors.add(AuthInterceptor());
  }
}
