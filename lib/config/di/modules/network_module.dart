import 'package:dio/dio.dart';
import 'package:elevate_bootcamp_c6_clean_arch/config/di/di.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/api_constants.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/auth_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
      sendTimeout: Duration(seconds: 20),
    );

    dio.interceptors.add(getIt<AuthInterceptor>());

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          // requestHeader: true,
          requestBody: true,
          responseBody: false,
          responseHeader: true,
          // responseHeader: false,
          // error: true,
          // compact: true,
          // maxWidth: 90,
        ),
      );
    }

    return dio;
  }
}
