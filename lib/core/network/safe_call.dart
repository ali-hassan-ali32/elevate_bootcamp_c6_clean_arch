import 'dart:async';
import 'package:dio/dio.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/errors/app_error.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';

Future<AppResults<T>> safeCall<T>(Future<AppResults<T>> Function() call) async {
  try {
    return call();
  } catch(e) {
    var error = handleError(e as Exception);
    return Failure(handleError(e).message, error);
  }
}

AppError handleError(Exception exception) {
  if(exception is DioException) {
    switch(exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeOutAppError('Connections Time Out', exception);
      case DioExceptionType.badCertificate:
        return BadCertificateAppError('Bad Certificate Error', exception);
      case DioExceptionType.badResponse:
        return BadResponseAppError(exception.response?.statusMessage ?? 'Something Went Wrong');
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
      case DioExceptionType.transformTimeout:
        return IgnoreAppError();
    }
  }

  return IgnoreAppError();
}