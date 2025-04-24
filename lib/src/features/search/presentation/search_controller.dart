import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/search/data/repository/search_repository.dart';

import '../../home/domain/product_model.dart';
part 'search_controller.g.dart';

@Riverpod(keepAlive: true)
class SearchController extends _$SearchController {
  @override
  FutureOr<List<ProductModel>> build() async {
    return await ref.read(searchRepositoryProvider).getAllProducts();
  }

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async =>
        await ref.read(searchRepositoryProvider).searchProducts(query));
  }

  // Future<void> refreshProducts() async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(
  //       () async => await ref.read(searchRepositoryProvider).getAllProducts());
  // }
}
