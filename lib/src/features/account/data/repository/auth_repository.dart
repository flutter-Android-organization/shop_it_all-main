import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/exception/app_exception.dart';
import 'package:shop_it_all/src/features/account/domain/app_user.dart';
import 'package:shop_it_all/src/utils/shared_prefs_box.dart';
part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this.ref);
  final Ref ref;
  static const String _currentUserKey = 'currentUser';
  static const String _userKey = 'userKey';

  // Fetch users from SharedPreferences
  Future<List<AppUser>> listOfUsers() async {
    final prefs = await ref.read(sharedPrefsBoxProvider).readInfo(_userKey);
    if (prefs != null) {
      List<dynamic> prefsList = await jsonDecode(prefs);
      return prefsList.map((json) => AppUser.fromJson(json)).toList();
    }
    return [];
  }

  Future<AppUser?> getCurrentUser() async {
    final json =
        await ref.read(sharedPrefsBoxProvider).readInfo(_currentUserKey);
    if (json == null) return null;

    return AppUser.fromJson(jsonDecode(json));
  }

  Future<void> setUser(AppUser user) async {
    final json = jsonEncode(user.toJson());
    await ref.read(sharedPrefsBoxProvider).writeInfo(_currentUserKey, json);
  }

  //Sign In (Stores the logged-in user in SharedPreferences)
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final users = await listOfUsers();

    for (final u in users) {
      if (u.email == email && u.password == password) {
        // Save current user session
        final prefs = ref.read(sharedPrefsBoxProvider);
        await prefs.writeInfo(_currentUserKey, jsonEncode(u.toJson()));
        return;
      }
      if (u.email == email && u.password != password) {
        throw WrongPasswordException();
      }
    }
    throw UserNotFoundException();
  }

  Future<bool> isUserRegistered(String email, String password) async {
    try {
      final storedUserJson =
          await ref.read(sharedPrefsBoxProvider).readInfo(_userKey);
      if (await storedUserJson == null) return false;

      // Handle both list and map formats
      final parsedData = await jsonDecode(storedUserJson);

      Map<String, dynamic> userData;
      if (parsedData is List<dynamic>) {
        // Take first item if it's a list
        userData = parsedData.first as Map<String, dynamic>;
      } else {
        userData = parsedData as Map<String, dynamic>;
      }

      final storedUser = AppUser.fromJson(userData);

      final emailMatch =
          storedUser.email.trim().toLowerCase() == email.trim().toLowerCase();
      final passwordMatch = storedUser.password == password;

      return emailMatch && passwordMatch;
    } catch (e) {
      log('Credential verification failed: ${e.toString()}');
      return false;
    }
  }

  // Save users back to SharedPreferences
  Future<void> _saveUsers(List<AppUser> users) async {
    final prefs = ref.read(sharedPrefsBoxProvider);
    await prefs.writeInfo(
        _userKey, jsonEncode(users.map((u) => u.toJson()).toList()));
  }

  // Register a new user
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final users = await listOfUsers();

    // Check if email is already used
    if (users.any((u) => u.email == email)) {
      throw EmailAlreadyInUseException();
    }

    // Add the new user and save the updated list
    // users.add(AppUser(email: email, password: password));
    final updateList = [...users, AppUser(email: email, password: password)];
    await _saveUsers(updateList);
  }

  // Sign Out (Clears user session from SharedPreferences)
  Future<void> signOut() async {
    final prefs = ref.read(sharedPrefsBoxProvider);
    await prefs.removeInfo(_currentUserKey);
  }

  Future<bool> isUserLoggedIn() async {
    final currentPrefs =
        await ref.read(sharedPrefsBoxProvider).readInfo(_currentUserKey);
    return currentPrefs != null; // If prefs exist, user is logged in
  }
}

@riverpod
Future<AuthRepository> authRepository(ref) async {
  return AuthRepository(ref);
}
