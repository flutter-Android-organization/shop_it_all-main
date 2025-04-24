import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/wishlist/data/repository/wish_list_preference_repository.dart';
import '../../../home/domain/product_model.dart';
part 'wish_list_page_controller.g.dart';


@riverpod
class WishListPageController extends _$WishListPageController {
  @override
  Future<List<ProductModel>> build() async {
    return await ref.watch(loadWishDataProvider.future);
  }

  Future<void> toggleProductInWishList(ProductModel product) async {
    final repo = await ref.watch(wishListRepositoryProvider.future);
    final updateList = await repo.toggleProduct(product);
    state = AsyncData<List<ProductModel>>(updateList);
  }

  // Clear checkout
  Future<void> clearWishlist() async {
    final repo = await ref.watch(wishListRepositoryProvider.future);
    await repo.clearWishlistItems();
    state = const AsyncData<List<ProductModel>>([]);
  }
}