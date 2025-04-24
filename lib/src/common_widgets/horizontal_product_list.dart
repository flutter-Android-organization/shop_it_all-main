import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/product_card.dart';
import 'package:shop_it_all/src/common_widgets/show_snack_bar.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/features/cart/presentation/controller/cart_page_controller.dart';
import 'package:shop_it_all/src/features/cart/presentation/controller/item_controller.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/controller/wish_list_page_controller.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';
import '../constants/padding_constants.dart';
import '../features/home/data/repository/local/local_product_repository.dart';
import '../features/product/presentation/product_page.dart';

class HorizontalProductList extends ConsumerStatefulWidget {
  const HorizontalProductList({super.key, required this.isAllowed});

  final bool isAllowed;

  @override
  ConsumerState createState() => _HorizontalProductListState();
}

class _HorizontalProductListState extends ConsumerState<HorizontalProductList> {

  @override
  Widget build(BuildContext context) {
    final productQuantities = ref.watch(itemControllerProvider).value ?? {};
    final productCartState = ref.watch(cartPageControllerProvider.notifier);
    final providerFetchProduct = ref.watch(fetchProductProvider);
    final likeItState = ref.watch(wishListPageControllerProvider);
    return AsyncValueWidget<List<ProductModel>>(
        value: providerFetchProduct,
        data: (productData) => Container(
              padding: pdHor10,
              height: 350, // Fixed height for the horizontal ListView
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Set scroll direction to horizontal
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final data = productData[index];
                  final selectedItems =
                      likeItState.value ?? []; // Extract state safely
                  final isSelected =
                      selectedItems.contains(data); // Check if selected
                  final quantity = productQuantities[data.productId] ?? 1;
                  final cardColor = cardColors[index % 4];
                  return ProductCard(
                    cardColor: cardColor,
                    productModel: data,
                    isAllowed: widget.isAllowed,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            backColor: cardColor,
                            topProduct: data,
                            addToCart: () async {
                              final updatedProduct =
                                  data.copyWith(quantity: quantity);
                              productCartState.addToCart(updatedProduct);
                              showSnackBar(
                                  context,
                                  '${updatedProduct.productName} is added to cart',
                                  'assets/images/random_images/correct.png');
                              Navigator.of(context).pop();
                            },
                            onQuantityChanged: (int value) {
                              final listUpdate = data.copyWith(
                                  quantity:
                                      quantity); // updateQuantity(data.productId, value);
                              productCartState.addToCart(listUpdate);
                            },
                          ),
                        ),
                      );
                    },
                    onLike: () async {
                      await ref
                          .read(wishListPageControllerProvider.notifier)
                          .toggleProductInWishList(data);
                    },
                    likeIcon: Icon(
                        isSelected ? Icons.favorite : Icons.favorite_border),
                  );
                },
              ),
            ));
  }
}
