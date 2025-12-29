import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/services/local_storage/local_storage.dart';

final authStorageProvider = Provider<AuthStorage>(
  (ref) => AuthStorage(ref.read(localStorageProvider)),
);

class AuthStorage {
  final LocalStorage _localStorage;

  AuthStorage(LocalStorage localStorage) : _localStorage = localStorage;

  Future<void> saveAccessToken(String accessToken) async {
    await _localStorage.saveData('accessToken', accessToken);
  }

  Future<String?> getAccessToken() async {
    return await _localStorage.getData<String>('accessToken');
  }

  Future<void> removeAccessToken() async {
    await _localStorage.removeData('accessToken');
  }
}
