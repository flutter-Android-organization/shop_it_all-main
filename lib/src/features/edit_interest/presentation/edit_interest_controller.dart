
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/edit_interest/data/edit_search_repository.dart';
import 'package:shop_it_all/src/features/home/domain/category_model.dart';
part 'edit_interest_controller.g.dart';


@Riverpod(keepAlive: true)
class EditInterestController extends _$EditInterestController {
  @override
  FutureOr<List<CategoryModel>> build() async {
   return await ref.read(editSearchRepositoryProvider).getAllProducts();
  }

  Future<void> editSearch(String query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async =>
    await ref.read(editSearchRepositoryProvider).searchProducts(query));
  }

  Future<void> refreshEditCategory() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
            () async => await ref.read(editSearchRepositoryProvider).getAllProducts());
  }

}