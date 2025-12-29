import 'package:dio/dio.dart';
import 'package:mobile/data/datasources/local/auth_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage _authStorage;

  AuthInterceptor({required AuthStorage authStorage})
    : _authStorage = authStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final accessToken = await _authStorage.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      await _authStorage.removeAccessToken();
    }
    handler.next(err);
  }
}
