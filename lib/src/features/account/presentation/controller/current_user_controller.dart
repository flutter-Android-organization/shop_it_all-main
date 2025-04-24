import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/account/data/repository/auth_repository.dart';
import 'package:shop_it_all/src/features/account/domain/app_user.dart';
part 'current_user_controller.g.dart';


@Riverpod(keepAlive: true)
class CurrentUserController extends _$CurrentUserController {
  @override
  FutureOr<AppUser?> build() async {
    final prefs = await ref.read(authRepositoryProvider.future);
    return prefs.getCurrentUser();
  }

  Future<void> setUser(AppUser user) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final prefs = await ref.read(authRepositoryProvider.future);
      await prefs.setUser(user);
      return user;
    });
  }

  Future<void> logOut() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final prefs = await ref.read(authRepositoryProvider.future);
      await prefs.signOut();
      return null;
    });
  }

  Future<bool> isLoggedIn() async {
    final repo = await ref.read(authRepositoryProvider.future);
    return await repo.isUserLoggedIn();
  }

}