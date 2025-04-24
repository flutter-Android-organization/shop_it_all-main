import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/avatar_image_header.dart';
import 'package:shop_it_all/src/common_widgets/layout_With_button_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AvatarImageHeader(
            avatarImage:
                'assets/images/random_images/—Pngtree—map location icon isolate on_18770058.png',
            avatarText: 'address Information'),
        LayoutWithButtonWidget(
            navToAddress: () => context.goNamed(RouteNames.address.name),
            children: const [
              Text('Your address ...'),
              gbHt5,
              Text('87 Independence Avenue, Accra', softWrap: true, style: TextStyle(fontSize: 14, color: Colors.grey))
            ]
        )
      ],
    );
  }
}
