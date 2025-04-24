import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/tem_product_card.dart';
import 'package:shop_it_all/src/common_widgets/unavailable_item_widget.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/controller/wish_list_page_controller.dart';
import '../../../common_widgets/show_snack_bar.dart';
import '../../../utils/async_value_widget.dart';
import '../../cart/presentation/controller/cart_page_controller.dart';
import '../../cart/presentation/controller/item_controller.dart';
import '../../product/presentation/product_page.dart';

class WishList extends ConsumerWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productQuantities = ref.watch(itemControllerProvider).value ?? {};
    final productCartState = ref.read(cartPageControllerProvider.notifier);
    final wishState = ref.watch(wishListPageControllerProvider);
    return AsyncValueWidget<List<ProductModel>>(
      value: wishState,
      data: (indexedProduct) {
        if (indexedProduct.isEmpty) {
          return const UnavailableItemWidget(
              unavailableText: 'Wish List Is Empty');
        }
        return Column(
          children: indexedProduct.map((wishData) {
            final quantity = productQuantities[wishData.productId] ?? 1;
            return ProductItem(
              itemList: wishData,
              toCart: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    topProduct: wishData,
                    addToCart: () {
                      final updatedProduct =
                          wishData.copyWith(quantity: quantity);
                      productCartState.addToCart(updatedProduct);
                      showSnackBar(
                          context,
                          '${updatedProduct.productName} is added to cart',
                          'assets/images/random_images/correct.png');
                      Navigator.of(context).pop();
                    },
                    onQuantityChanged: (int value) {
                      final listUpdate = wishData.copyWith(quantity: quantity);
                      productCartState.addToCart(listUpdate);
                    },
                  ),
                ),
              ), //wishState.addItemToCart(wishData),
              trueIcon: true,
            );
          }).toList(),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.itemList,
      required this.toCart,
      this.trueIcon = true});

  final ProductModel itemList;
  final VoidCallback toCart;
  final bool trueIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: TemProductCard(
        temImage: itemList.productImage,
        temProductName: itemList.productName,
        temPrice: itemList.productPrice,
        temOnCart: toCart,
        temDescription: itemList.productDescription,
        trueIcon: trueIcon,
      ),
    );
  }
}
