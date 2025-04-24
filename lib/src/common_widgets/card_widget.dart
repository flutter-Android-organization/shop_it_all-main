import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';

import '../constants/color_constants.dart';
import '../constants/content_gaps_constants.dart';
import '../constants/padding_constants.dart';


class ItemImage extends StatelessWidget {
  const ItemImage(
      {super.key,
        required this.productImage,
        required this.onCart,
        required this.cartIcon,
        required this.height,
        required this.width,
        this.likeKey,
        this.trueIcon = true,
        this.favColor = Colors.pink
      });

  final String productImage;
  final VoidCallback onCart;
  final Widget cartIcon;
  final double height;
  final double width;
  final Key? likeKey;
  final bool trueIcon;
  final Color favColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(productImage),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: pdAll5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (trueIcon)
              IconButton(
                color: favColor,
                key: likeKey,
                onPressed: onCart,
                icon: cartIcon,
                highlightColor: btnColor,
              )
          ],
        ),
      ),
    );
  }
}

class ItemsDetails extends StatelessWidget {
  const ItemsDetails(
      {super.key,
        required this.productName,
        required this.productPrice,
        required this.productDescription,
        required this.allowed
      });

  final String productName;
  final double productPrice;
  final String productDescription;
  final bool allowed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pd1All0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          gbHt5,
          // Product price
          Text(
            '\$${productPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14.0, color: Colors.green),
          ),
          gbHt5,
          // Product description
          if (allowed == true)
            Text(
              productDescription,
              style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
