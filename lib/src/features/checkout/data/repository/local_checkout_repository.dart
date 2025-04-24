import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../home/domain/product_model.dart';
part 'local_checkout_repository.g.dart';



class LocalCheckoutRepository {
  LocalCheckoutRepository({required this.prefsCheckout});

  final SharedPreferences prefsCheckout;
  static const String _checkoutListKey = 'checkout_list_key';

  // Save updated checkout list to SharedPreferences
  Future<void> _saveCheckoutList(List<ProductModel> productList) async {
    final prefs = prefsCheckout;
    await prefs.setString(
      _checkoutListKey,
      jsonEncode(productList.map((p) => p.toJson()).toList()),
    );
  }

  // Save checkout items to SharedPreferences
  Future<void> setItemInCheckout(List<ProductModel> items) async {
    final prefs = prefsCheckout;
    final String jsonString = json.encode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_checkoutListKey, jsonString);
  }


  Future<List<ProductModel>> addItemsToCheckout(List<ProductModel> newItems) async {
    final existingItems = await loadCheckoutList();

    for (var newItem in newItems) {
      final existingIndex = existingItems.indexWhere((item) => item.productId == newItem.productId);
      if (existingIndex != -1) {
        existingItems[existingIndex] = existingItems[existingIndex].copyWith(
          quantity: existingItems[existingIndex].quantity + newItem.quantity,
        );
      } else {
        existingItems.add(newItem);
      }
    }

    await _saveCheckoutList(existingItems);
    return existingItems;
  }



  Future<List<ProductModel>> loadCheckoutList() async {
    final prefs = prefsCheckout;
    final jsonString = prefs.getString(_checkoutListKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    }
    return [];
  }

  // Clear checkout items
  Future<void> clearCheckoutItems() async {
    final prefs = prefsCheckout;
    await prefs.remove(_checkoutListKey);
  }
}

@riverpod
Future<SharedPreferences> sharedPreferencesCheckout (ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
Future<LocalCheckoutRepository> localCheckoutRepository (ref) async {
   final prefs = await ref.watch(sharedPreferencesCheckoutProvider.future);
   return LocalCheckoutRepository(prefsCheckout: prefs);
}

@riverpod
Future<List<ProductModel>> loadCheckoutData (ref) async {
  final repo = await ref.watch(localCheckoutRepositoryProvider.future);
  return repo.loadCheckoutList();
}


