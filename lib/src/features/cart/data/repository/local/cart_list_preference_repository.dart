import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/utils/shared_prefs_box.dart';
import '../../../../../shared_datastore/shared_preference.dart';
part 'cart_list_preference_repository.g.dart';

class CartListPreferenceRepository {
  CartListPreferenceRepository(this.ref);
  final Ref ref;
  static const String _cartListKey = 'cart_list_key';

  Future<List<ProductModel>> loadCartList() async {
    final jsonString =
        await ref.read(sharedPrefsBoxProvider).readInfo(_cartListKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    }
    return [];
  }

  // Save updated wishlist to SharedPreferences
  Future<void> _saveCartList(List<ProductModel> productList) async {
    final jsonString = jsonEncode(productList.map((p) => p.toJson()).toList());
    await ref.read(sharedPrefsBoxProvider).writeInfo(
          _cartListKey,
          jsonString,
        );
  }

  Future<List<ProductModel>> addProductToCart(ProductModel product) async {
    final productList = await loadCartList();

    // Check if the product already exists in the cart
    final existingIndex =
        productList.indexWhere((p) => p.productId == product.productId);

    if (existingIndex != -1) {
      productList[existingIndex].quantity += product.quantity;
    } else {
      productList.add(product); // Add only if it's not already in the list
    }

    await _saveCartList(productList);
    return productList;
  }

  Future<List<ProductModel>> removeProductFromCart(ProductModel product) async {
    final productList = await loadCartList();
    final existingIndex =
        productList.indexWhere((p) => p.productId == product.productId);

    if (existingIndex != -1) {
      productList.removeAt(existingIndex);
    }

    await _saveCartList(productList);
    return productList;
  }

  // Clear entire cart
  Future<void> clearCart() async {
    await ref.read(sharedPrefsBoxProvider).removeInfo(_cartListKey);
  }
}

@riverpod
Future<CartListPreferenceRepository> cartListRepository(ref) async {
  return CartListPreferenceRepository(ref);
}

@riverpod
Future<List<ProductModel>> loadCartData(ref) async {
  final repo = await ref.watch(cartListRepositoryProvider.future);
  return repo.loadCartList();
}
