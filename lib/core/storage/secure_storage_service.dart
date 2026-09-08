import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _secureStorage;
  SecureStorageService(this._secureStorage);

  static const String tokenKey = 'token';

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: tokenKey);
  }

  Future<void> clearToken() async {
    await _secureStorage.delete(key: tokenKey);
  }

  Future<void> clearStorage() async {
    await _secureStorage.deleteAll();
  }
}
