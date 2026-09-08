import 'package:elevate_bootcamp_c6_clean_arch/core/errors/app_error.dart';

sealed class AppResults<T> {
  // String? errorMessage;
  // Exception? exception;
  AppError? appError;
  T? data;

  AppResults({this.data, this.appError});
}

class Success<T> extends AppResults<T> {
  Success(T? data) : super(data: data, appError: null);
}

class Failure<T> extends AppResults<T> {
  Failure(String? errorMessage, AppError? appError)
    : super(
        data: null,
        appError: appError,
        // errorMessage: errorMessage
      );
}
