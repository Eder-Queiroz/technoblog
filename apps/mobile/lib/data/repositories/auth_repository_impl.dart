import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/datasources/local/auth_storage.dart';
import 'package:mobile/data/datasources/remote/auth_api.dart';
import 'package:mobile/data/exceptions/auth_repository_exception.dart';
import 'package:mobile/domain/user/entities/user_entity.dart';
import 'package:mobile/domain/user/repositories/auth_repository.interface.dart';
import 'package:mobile/services/google_sign_in/google_sign_in_services.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepositoryImpl(
    authApi: ref.read(authApiProvider),
    authStorage: ref.read(authStorageProvider),
    googleSignInServices: ref.read(googleSignInServiceProvider),
  ),
);

class AuthRepositoryImpl implements IAuthRepository {
  final GoogleSignInServices _googleSignInServices;
  final AuthApi _authApi;
  final AuthStorage _authStorage;

  AuthRepositoryImpl({
    required AuthApi authApi,
    required AuthStorage authStorage,
    required GoogleSignInServices googleSignInServices,
  }) : _googleSignInServices = googleSignInServices,
       _authApi = authApi,
       _authStorage = authStorage;

  @override
  Future<LoggedUser> authenticate() async {
    final idToken = await _googleSignInServices.signIn();

    if (idToken == null) {
      throw MissingIdTokenException('ID token not found');
    }

    final user = await _authApi.authenticate(idToken);

    await _authStorage.saveAccessToken(user.accessToken);

    return user;
  }

  @override
  Future<GuestUser> getUser() async {
    return await _authApi.getUser();
  }

  @override
  Future<NotLoggedUser> logout() async {
    await _googleSignInServices.signOut();
    await _authStorage.removeAccessToken();

    return const NotLoggedUser();
  }
}
