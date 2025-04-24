import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/unavailable_item_widget.dart';
import 'package:shop_it_all/src/features/cart/presentation/cart_card.dart';
import 'package:shop_it_all/src/features/cart/presentation/controller/cart_page_controller.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';

class AddToCartArea extends ConsumerWidget {
  const AddToCartArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartPageControllerProvider);
    final cartState = ref.watch(cartPageControllerProvider.notifier);
    return AsyncValueWidget(
        value: cartProvider,
        data: (indexedCartProduct) {
          if (indexedCartProduct.isEmpty) {
            return const UnavailableItemWidget(
                unavailableText: 'No item available for checkout');
          }
          return Column(
            children: indexedCartProduct
                .map((cartData) => CardItems(
                      cardList: cartData,
                      removeFromCart: () => cartState.removeFromCart(cartData),
                    )).toList(),
          );
        });
  }
}

class CardItems extends StatelessWidget {
  const CardItems(
      {super.key, required this.cardList, required this.removeFromCart});

  final ProductModel cardList;
  final VoidCallback removeFromCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: CartCard(
        cartCardImage: cardList.productImage,
        cartProductName: cardList.productName,
        cartProductPrice: cardList.productPrice,
        removeFromCart: removeFromCart,
        itemQuantity: cardList.quantity,
      ),
    );
  }
}

class CheckOutDetails extends StatelessWidget {
  const CheckOutDetails(
      {super.key,
      required this.detailTitle,
      required this.detailText,
      required this.detailTextColor});

  final String detailTitle;
  final String detailText;
  final Color detailTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          detailTitle,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          detailText,
          softWrap: true,
          style: TextStyle(fontSize: 14, color: detailTextColor),
        )
      ],
    );
  }
}
