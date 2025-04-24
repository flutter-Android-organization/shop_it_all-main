import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/card_widget.dart';

class TemProductCard extends StatelessWidget {
  const TemProductCard(
      {super.key,
      required this.temImage,
      required this.temProductName,
      required this.temPrice,
      required this.temOnCart,
      required this.temDescription,
      this.trueIcon = true});

  final String temImage;
  final String temProductName;
  final double temPrice;
  final VoidCallback temOnCart;
  final bool trueIcon;
  final String temDescription;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.grey.withAlpha(70),
      shape: RoundedRectangleBorder(
          //side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 150,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemImage(
              productImage: temImage,
              onCart: temOnCart,
              cartIcon: const Icon(Icons.shopping_cart_outlined),
              height: double.infinity,
              width: 200,
              trueIcon: trueIcon,
              favColor: Colors.black,
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(temProductName,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text('\$ ${temPrice.toStringAsFixed(2)}',
                    style:
                        const TextStyle(fontSize: 15.0, color: Colors.green)),
                if (trueIcon)
                  Text(
                    temDescription,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
