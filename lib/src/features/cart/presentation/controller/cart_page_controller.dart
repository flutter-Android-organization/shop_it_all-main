import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/cart/data/repository/local/cart_list_preference_repository.dart';
import '../../../home/domain/product_model.dart';
part 'cart_page_controller.g.dart';

@riverpod
class CartPageController extends _$CartPageController {
  @override
  Future<List<ProductModel>> build() async {
    return await ref.watch(loadCartDataProvider.future);
  }

  Future<void> addToCart(ProductModel product) async {
    final repo = await ref.watch(cartListRepositoryProvider.future);
    final updateList = await repo.addProductToCart(product);
    state = AsyncData<List<ProductModel>>(updateList);
  }

  Future<void> removeFromCart(ProductModel product) async {
    final repo = await ref.watch(cartListRepositoryProvider.future);
    final updateList = await repo.removeProductFromCart(product);
    state = AsyncData<List<ProductModel>>(updateList);
  }

  // Clear entire cart
  Future<void> clearCart() async {
    final repo = await ref.watch(cartListRepositoryProvider.future);
    await repo.clearCart();
    state =  const AsyncData<List<ProductModel>>([]);
  }
}

@riverpod
double cartTotal(ref) {
  final cartAsync = ref.watch(cartPageControllerProvider);

  final cartProducts = cartAsync.value ?? [];

  return cartProducts.fold(
    0.0,
    (sum, product) => sum + (product.productPrice * product.quantity),
  );
}
