import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/item_quantity.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';

class ProductPageTop extends StatelessWidget {
  const ProductPageTop(
      {super.key,
      required this.topProduct,
      required this.addToCart,
      required this.onQuantityChanged,
      this.backColor = Colors.grey});

  final ProductModel topProduct;
  final VoidCallback addToCart;
  final ValueChanged<int> onQuantityChanged;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          height: 260,
          decoration: BoxDecoration(
            color: backColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      key: ShopItKeys.backBtnKey,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(
                      child: Image.asset(
                    topProduct.productImage,
                    width: 200,
                    height: 220,
                  ))
                ],
              ),
            ],
          ),
        ),
        gbHt5,
        TopPageDetails(
          detailTitle: topProduct.productName,
          detailPrice: topProduct.productPrice,
          detailDescription: topProduct.productDescription,
          addToCart: addToCart,
          onQuantityChanged: onQuantityChanged,
        ),
      ],
    );
  }
}

class TopPageDetails extends StatelessWidget {
  const TopPageDetails(
      {super.key,
      required this.detailTitle,
      required this.detailPrice,
      required this.detailDescription,
      required this.addToCart,
      required this.onQuantityChanged});

  final String detailTitle;
  final double detailPrice;
  final String detailDescription;
  final VoidCallback addToCart;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailTitle,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          gbHt5,
          Text(
            ' \$ $detailPrice',
            softWrap: true,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          gbHt5,
          Text(
            detailDescription,
            softWrap: true,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          gbHt10,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuantityBar(onQuantityChanged: onQuantityChanged),
              gbWd20,
              Expanded(
                  child: AddButton(
                btnBackground: btnColor,
                txtColor: Colors.black,
                key: ShopItKeys.addToCartKey,
                onWish: addToCart,
                wishIcon: Icons.add_shopping_cart,
                wishText: 'Add to cart',
              ))
            ],
          )
        ],
      ),
    );
  }
}
