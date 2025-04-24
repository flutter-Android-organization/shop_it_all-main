import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/account/data/repository/auth_repository.dart';
part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future build() async {
    final authState = await ref.read(authRepositoryProvider.future);
    return await authState.listOfUsers();
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = await ref.read(authRepositoryProvider.future);
      await repo.registerWithEmailAndPassword(email, password);
      return await repo.listOfUsers(); // Refresh user list after registration
    });
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = await ref.read(authRepositoryProvider.future);
      await repo.signInWithEmailAndPassword(email, password);
      return await repo.listOfUsers(); // Load users again if needed
    });
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = await ref.read(authRepositoryProvider.future);
      await repo.signOut();
      return null; // Reset state
    });
  }

  Future<bool> isUserRegistered(String email, String password) async {
    final repo = await ref.read(authRepositoryProvider.future);
    return await repo.isUserRegistered(email, password);
  }

}
