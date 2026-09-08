import 'package:dio/dio.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/storage/secure_storage_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final SecureStorageService _storageService;

  AuthInterceptor(this._storageService);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storageService.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle unauthorized requests
    if (err.response?.statusCode == 401) {
      // TODO:
      // - Clear stored token
      await _storageService.clearToken();
      // - Navigate to login screen
      // - Or trigger token refresh if your API supports it
    }

    handler.next(err);
  }
}