import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/checkout/data/repository/local_checkout_repository.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
part 'checkout_page_controller.g.dart';

@riverpod
class CheckoutPageController extends _$CheckoutPageController {
  @override
  Future<List<ProductModel>> build() async {
    return ref.watch(loadCheckoutDataProvider.future);
  }

  // Method to add items to checkout, merging with existing ones
  Future<void> setCheckoutItems(List<ProductModel> newItems) async {
    final repo = await ref.watch(localCheckoutRepositoryProvider.future);
    // Merge and save via repository method
    final updatedList = await repo.addItemsToCheckout(newItems);
    // Update state
    state = AsyncValue.data(updatedList);
  }

  // Clear checkout
  Future<void> clearCheckout() async {
    final repo = await ref.watch(localCheckoutRepositoryProvider.future);
    await repo.clearCheckoutItems();
    state = const AsyncData<List<ProductModel>>([]);
  }

}

@riverpod
double checkoutTotal(ref) {
  final cartAsync = ref.watch(checkoutPageControllerProvider);

  final checkoutProducts = cartAsync.value ?? [];

  return checkoutProducts.fold(
    0.0,
        (sum, product) => sum + (product.productPrice * product.quantity),
  );
}