abstract class AppError {
  String? message;
  Exception? exception;

  AppError(this.message, this.exception);
}

class TimeOutAppError extends AppError {
  TimeOutAppError(super.message, super.exception);
}

class BadCertificateAppError extends AppError {
  BadCertificateAppError(super.message, super.exception);
}

class ServerErrorAppError extends AppError {
  ServerErrorAppError(super.message, super.exception);
}

class IgnoreAppError extends AppError {
  IgnoreAppError(): super(null, null);
}

class BadResponseAppError extends AppError {
  BadResponseAppError(String message) : super(message, null);
}