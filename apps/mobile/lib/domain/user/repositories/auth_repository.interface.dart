import 'package:mobile/domain/user/entities/user_entity.dart';

abstract interface class IAuthRepository {
  Future<LoggedUser> authenticate();
  Future<NotLoggedUser> logout();
  Future<GuestUser> getUser();
}
