import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';

import '../constants/color_constants.dart';
import '../constants/content_gaps_constants.dart';
import '../constants/padding_constants.dart';


class ItemImage extends StatelessWidget {
  const ItemImage(
      {super.key,
        required this.productImage,
        required this.height,
        required this.width,
      });

  final String productImage;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(productImage),
            fit: BoxFit.cover,
          )),
      );
  }
}

class ItemsDetails extends StatelessWidget {
  const ItemsDetails(
      {super.key,
        required this.productName,
        required this.productPrice,
        required this.productDescription,
        required this.allowed,
        required this.onCart,
        required this.cartIcon,
        this.likeKey,
        this.trueIcon = true,
        this.favColor = Colors.pink,
      });

  final String productName;
  final double productPrice;
  final String productDescription;
  final bool allowed;
  final VoidCallback onCart;
  final Widget cartIcon;
  final Key? likeKey;
  final bool trueIcon;
  final Color favColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pd1All0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
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
