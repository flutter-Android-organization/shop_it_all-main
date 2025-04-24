import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/page_title.dart';
import 'package:shop_it_all/src/common_widgets/scrollable_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/cart/presentation/add_to_cart_area.dart';
import 'package:shop_it_all/src/features/cart/presentation/other_bought_section.dart';

import '../../../constants/padding_constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(
        children: [
          gbHt30,
          AddToCartArea(),
          const OtherBoughtHigh(),
          const OtherBoughtLow(),
          gbHt30
        ]
    );
  }
}
