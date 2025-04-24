import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/checkout/presentation/bottom_place_order.dart';
import 'package:shop_it_all/src/features/checkout/presentation/items_to_order.dart';
import 'package:shop_it_all/src/features/checkout/presentation/middle_info.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_checkout),
            gbWd10,
            Text('Checkout')
          ],
        ),
      ),
      body: const SingleChildScrollView(
        padding: pd1All0,
        child: ItemsToOrder(),
      ),
      bottomNavigationBar: const BottomPlaceOrder(),
    );
  }
}





