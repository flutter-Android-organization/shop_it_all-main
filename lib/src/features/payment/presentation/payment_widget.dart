import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/avatar_image_header.dart';
import 'package:shop_it_all/src/common_widgets/layout_With_button_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AvatarImageHeader(
            avatarImage: 'assets/images/random_images/payment.png',
            avatarText: 'Payment Information'),
        LayoutWithButtonWidget(
            navToAddress: () => context.goNamed(RouteNames.payment.name),
            children: const [
              Text('Payment method ...'),
              gbHt5,
              Text(
                '+223 ** *** **57',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
            ]),
        gbHt10,
        LayoutWithButtonWidget(
            navToAddress: () => context.goNamed(RouteNames.payment.name),
            children: const [
              Text('Billings address ...'),
              gbHt5,
              Text(
                'The same as the shipping address ',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
            ])
      ],
    );
  }
}
