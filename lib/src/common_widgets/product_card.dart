import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import '../constants/color_constants.dart';
import '../features/home/domain/product_model.dart';
import 'card_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.productModel,
      required this.isAllowed,
      required this.onTap,
      required this.onLike,
      required this.likeIcon,
      this.cardColor,
        this.cardWidth = 160,
        this.cardHeight = 180
      });

  final ProductModel productModel;
  final bool isAllowed;
  final VoidCallback onTap;
  final VoidCallback onLike;
  final Widget likeIcon;
  final Color? cardColor;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        color: cardColor,
        key: ShopItKeys.productCardKey,
        margin: pdAll5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: btnColor,
          onTap: onTap,
          mouseCursor: MouseCursor.defer,
          child: Padding(
            padding: pdAll5,
            child: SizedBox(
              width: cardWidth, // Fixed width for each card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ItemImage(
                    productImage: productModel.productImage,
                    height: cardHeight,
                    width: cardHeight,
                  ),
                  ItemsDetails(
                    likeKey: ShopItKeys.likeBtnKey,
                    onCart: onLike,
                    cartIcon: likeIcon,
                    productName: productModel.productName,
                    productPrice: productModel.productPrice,
                    productDescription: productModel.productDescription,
                    allowed: isAllowed,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({
    super.key,
    required this.productHorModel,
    required this.isHorAllowed,
    required this.toCart,
  });

  final ProductModel productHorModel;
  final bool isHorAllowed;
  final VoidCallback toCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adds a shadow effect
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Adjust margins as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: pdAll5,
        child: SizedBox(
          height: 150, // Fixed height for the card
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align items to start
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemImage(
                productImage: productHorModel.productImage,
                height: 150, // Match the card height
                width: 150, // Adjust width as needed
              ),
              const SizedBox(width: 10), // Space between image and details
              Expanded(
                // Allows details to take remaining space
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetails(
                      onCart: () {}, // You can implement this function if needed
                      cartIcon: const Icon(Icons.favorite_border),
                      productName: productHorModel.productName,
                      productPrice: productHorModel.productPrice,
                      productDescription: productHorModel.productDescription,
                      allowed: isHorAllowed,
                    ),
                    const SizedBox(
                        height: 8), // Space between details and button
                    BlackAddButton(toCart: toCart, addText: 'Add To Cart',),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
