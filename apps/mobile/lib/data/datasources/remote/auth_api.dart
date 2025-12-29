import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/user/entities/user_entity.dart';
import 'package:mobile/services/api/api_client.dart';

final authApiProvider = Provider(
  (ref) => AuthApi(apiClient: ref.read(apiClientProvider)),
);

class AuthApi {
  final ApiClient _apiClient;

  AuthApi({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<LoggedUser> authenticate(String idToken) async {
    return await _apiClient.post<LoggedUser>(
      '/auth',
      deserialize: (json) => LoggedUser.fromJson(json),
      data: {'idToken': idToken},
    );
  }

  Future<GuestUser> getUser() async {
    return await _apiClient.get<GuestUser>(
      '/user/me',
      deserialize: (json) => GuestUser.fromJson(json),
    );
  }
}
