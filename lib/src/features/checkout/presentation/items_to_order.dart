import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/cart/presentation/cart_card.dart';
import 'package:shop_it_all/src/features/checkout/presentation/controller/checkout_page_controller.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';
import '../../../common_widgets/unavailable_item_widget.dart';
import 'middle_info.dart';

class ItemsToOrder extends ConsumerWidget {
  const ItemsToOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutSate = ref.watch(checkoutPageControllerProvider);
    final checkoutTotal = ref.watch(checkoutTotalProvider);
    return AsyncValueWidget(
        value: checkoutSate,
        data: (indexedCheckoutItem) {
          if (indexedCheckoutItem.isEmpty) {
            return const UnavailableItemWidget(
                unavailableText: 'No Ordered Item');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: indexedCheckoutItem
                    .map((checkoutData) =>
                        CheckoutOrderItem(orderItem: checkoutData)).toList(),
              ),
              gbHt20,
              AmountDetailArea(itemFigure: checkoutTotal),
              gbHt20,
              const MiddleInfo(),
            ],
          );
        });
  }
}

class CheckoutOrderItem extends StatelessWidget {
  const CheckoutOrderItem({super.key, required this.orderItem});

  final ProductModel orderItem;

  @override
  Widget build(BuildContext context) {
    return CartCard(
      cartCardImage: orderItem.productImage,
      cartProductName: orderItem.productName,
      cartProductPrice: orderItem.productPrice,
      itemQuantity: orderItem.quantity,
      buttOrDescription: false,
      addDescription: orderItem.productDescription,
    );
  }
}


class AmountDetailArea extends StatelessWidget {
  const AmountDetailArea({super.key, required this.itemFigure});

  final double itemFigure;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        gbHt10,
        const AmountDetail(amountText: 'Shipping', figure: 0.00),
        gbHt5,
        const AmountDetail(amountText: 'Tax', figure: 0.00),
        gbHt5,
        AmountDetail(amountText: 'Total', figure: itemFigure, numTo: false,),
        gbHt5,
      ],
    );
  }
}

class AmountDetail extends StatelessWidget {
  const AmountDetail({super.key, required this.amountText, required this.figure, this.numTo = true});

  final String amountText;
  final double figure;
  final bool numTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          amountText,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: numTo ? 14 : 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$${figure.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: numTo ? 14 : 16,
          ),
        )
      ],
    );
  }
}
