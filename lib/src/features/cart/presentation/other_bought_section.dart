import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_product_list.dart';
import 'package:shop_it_all/src/common_widgets/product_list_header.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/features/cart/presentation/controller/cart_page_controller.dart';
import 'package:shop_it_all/src/features/checkout/presentation/controller/checkout_page_controller.dart';
import '../../../common_widgets/add_button.dart';
import '../../../common_widgets/horizontal_bar.dart';
import '../../../common_widgets/my_dialog_box.dart';
import '../../../routes/route_names.dart';
import 'add_to_cart_area.dart';


class OtherBoughtHigh extends ConsumerWidget {
  const OtherBoughtHigh({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final total = ref.watch(cartTotalProvider);
    final itemsInCart = ref.watch(cartPageControllerProvider).value ?? [];
    final checkoutState = ref.watch(checkoutPageControllerProvider.notifier);
    final cartState = ref.watch(cartPageControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckOutDetails(
                detailTitle: 'Product Total',
                detailText:'\$ ${total.toStringAsFixed(2)}', // Format as currency otherwise
                detailTextColor: Colors.green,
              ),
              gbHt10,
              const CheckOutDetails(
                detailTitle: 'Location',
                detailText: 'Independence Avenue',
                detailTextColor: Colors.black,
              ),
              gbHt30,
              AddButton(
                key: ShopItKeys.checkoutBtnKey,
                txtColor: Colors.black,
                btnBackground: btnColor,
                onWish: () async {
                  if (itemsInCart.isNotEmpty) {
                    await checkoutState.setCheckoutItems(itemsInCart);
                    cartState.clearCart();
                    context.goNamed(RouteNames.checkout.name);
                  } else {
                    context.goNamed(RouteNames.checkout.name);
                  }},
                wishIcon: Icons.shopping_cart_checkout,
                wishText: 'Checkout',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OtherBoughtLow extends StatelessWidget {
  const OtherBoughtLow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductListHeader(
          titleList: 'Others Bought',
          text: 'See all',
          onHeader: () {
            myDialogBox(context);
          },
        ),
        const HorizontalProductList(isAllowed: true),
      ],
    );
  }
}
