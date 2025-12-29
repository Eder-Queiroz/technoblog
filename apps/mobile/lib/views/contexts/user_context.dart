import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/repositories/auth_repository_impl.dart';
import 'package:mobile/domain/user/entities/user_entity.dart';
import 'package:mobile/domain/user/repositories/auth_repository.interface.dart';

final userContextProvider = AsyncNotifierProvider<UserContext, User>(
  UserContext.new,
);

class UserContext extends AsyncNotifier<User> {
  late final IAuthRepository _authRepository;

  @override
  Future<User> build() async {
    _authRepository = ref.read(authRepositoryProvider);
    return await _authRepository.getUser();
  }

  Future<void> login() async {
    state = AsyncLoading();

    state = await AsyncValue.guard(
      () async => await _authRepository.authenticate(),
    );
  }

  Future<void> logout() async {
    state = AsyncLoading();

    state = await AsyncValue.guard(() async => await _authRepository.logout());
  }

  bool get isAuthenticated {
    final user = state.valueOrNull;
    final isAuthenticated = user != null && user is! NotLoggedUser;
    return isAuthenticated;
  }
}
