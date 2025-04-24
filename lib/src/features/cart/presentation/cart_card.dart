import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

import '../../../common_widgets/card_widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.cartCardImage,
    required this.cartProductName,
    required this.cartProductPrice,
    required this.itemQuantity,
    this.removeFromCart = _defaultRemoveFromCart,
    this.buttOrDescription = true,
    this.addDescription = '',
  });

  final String cartCardImage;
  final String cartProductName;
  final double cartProductPrice;
  final int itemQuantity;
  final VoidCallback removeFromCart;
  final bool buttOrDescription;
  final String addDescription;

  static void _defaultRemoveFromCart() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0, // Optional: Set elevation to 0 for outlined look
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildItemImage(cartCardImage),
          _buildProductDetails(
            cartProductName,
            cartProductPrice,
            itemQuantity,
            removeFromCart,
            buttOrDescription,
            addDescription,
          ),
        ],
      ),
    );
  }

  Widget _buildItemImage(String image) {
    return ItemImage(
      productImage: image,
      onCart: () {},
      cartIcon: const Icon(Icons.shopping_cart_outlined),
      height: 180, // Set a fixed height for the image
      width: 180, // Set a fixed width for the image
      trueIcon: false,
      favColor: Colors.black,
    );
  }

  Widget _buildProductDetails(
      String productName,
      double productPrice,
      int quantity,
      VoidCallback removeFromCart,
      bool buttOrDescription,
      String addDescription,
      ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use MainAxisSize.min
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProductName(productName),
            _buildProductPrice(productPrice),
            _buildQuantity(quantity),
            _buildAction(removeFromCart, buttOrDescription, addDescription),
          ],
        ),
      ),
    );
  }

  Widget _buildProductName(String name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProductPrice(double price) {
    return Text(
      '\$ ${price.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 14.0, color: Colors.green),
    );
  }

  Widget _buildQuantity(int quantity) {
    return Text(
      'Quantity : $quantity',
      style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAction(
      VoidCallback removeFromCart,
      bool buttOrDescription,
      String addDescription,
      ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0), // Adjust padding
      child: buttOrDescription
          ? AddButton(
        btnBackground: btnColor,
          txtColor: Colors.black,
          onWish: removeFromCart,
          wishIcon: Icons.remove_shopping_cart_outlined,
          wishText: 'Remove')
          : Text(
        addDescription,
        softWrap: true,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}

