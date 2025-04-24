import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/my_dialog_box.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/features/checkout/presentation/controller/checkout_page_controller.dart';
import '../../../common_widgets/add_button.dart';
import '../../../common_widgets/horizontal_bar.dart';
import '../../../constants/content_gaps_constants.dart';
import '../../../constants/padding_constants.dart';
import 'checkout_message.dart';

class BottomPlaceOrder extends ConsumerStatefulWidget {
  const BottomPlaceOrder({super.key});

  @override
  ConsumerState createState() => _BottomPlaceOrderState();
}

class _BottomPlaceOrderState extends ConsumerState<BottomPlaceOrder> {
  @override
  Widget build(BuildContext context) {
    final checkoutButton =
        ref.watch(checkoutPageControllerProvider).value ?? [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        gbHt10,
        const HorizontalBar(barMargin: pdAll),
        gbHt10,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: pd1All0,
                child: AddButton(
                  btnBackground: Colors.black,
                  txtColor: Colors.white,
                  key: ShopItKeys.placeBtnKey,
                    onWish: checkoutButton.isEmpty
                        ? () {}
                        : () async {
                            showAutoDismissDialog(context);
                            await ref
                                .watch(checkoutPageControllerProvider.notifier)
                                .clearCheckout();
                          },
                    wishIcon: Icons.shopping_cart_outlined,
                    wishText: 'place Order'),
              ),
            )
          ],
        )
      ],
    );
  }
}
