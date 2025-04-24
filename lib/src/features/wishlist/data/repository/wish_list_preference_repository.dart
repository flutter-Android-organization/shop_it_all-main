import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/utils/shared_prefs_box.dart';
part 'wish_list_preference_repository.g.dart';

class WishListPreferenceRepository {
  WishListPreferenceRepository(this.ref);
  final Ref ref;
  static const String _wishListKey = 'wish_list_key';

  Future<List<ProductModel>> loadWishList () async {
    final jsonString = await ref.read(sharedPrefsBoxProvider).readInfo(_wishListKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> _saveWishlist(List<ProductModel> productList) async {
    final jsonList = jsonEncode(productList.map((p) => p.toJson()).toList());
    await ref.read(sharedPrefsBoxProvider).writeInfo(_wishListKey, jsonList);
  }


  // Toggle product in the wishlist (add/remove)
  Future<List<ProductModel>> toggleProduct(ProductModel product) async {
    final productList = await loadWishList();
    final existingIndex = productList.indexWhere((p) => p.productId == product.productId);
    if (existingIndex != -1) {
      productList.removeAt(existingIndex);
    } else {
      productList.add(product);
    }
    await _saveWishlist(productList);
    return productList; // Return updated list
  }

  // Clear checkout items
  Future<void> clearWishlistItems() async {
    await ref.read(sharedPrefsBoxProvider).removeInfo(_wishListKey);
  }
}


@riverpod
Future<WishListPreferenceRepository> wishListRepository (ref) async {
  return WishListPreferenceRepository(ref);
}

@riverpod
Future<List<ProductModel>> loadWishData (ref) async {
  final repo = await ref.watch(wishListRepositoryProvider.future);
  return await repo.loadWishList();
}
