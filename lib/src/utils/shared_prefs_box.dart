import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_it_all/src/shared_datastore/shared_preference.dart';
part 'shared_prefs_box.g.dart';

class SharedPrefsBox {
  SharedPrefsBox(this.ref);

  final Ref ref;

  Future<SharedPreferences> get _prefs async =>
      await ref.read(sharedPreferencesProvider.future);

  Future<dynamic> writeInfo(String key, String keyValue) async {
   final prefs = await _prefs;
   return prefs.setString(key, keyValue);
  }

  Future<dynamic> readInfo(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<bool> containsInfo(String key) async {
    final prefs = await _prefs;
    if (prefs.containsKey(key)) return true;
    return false;
  }

  Future<void> removeInfo(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }
}


@riverpod
SharedPrefsBox sharedPrefsBox (ref) {
  return SharedPrefsBox(ref);
}