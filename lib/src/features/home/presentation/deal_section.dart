import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/product_card.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/features/home/presentation/see_all_page.dart';
import 'package:shop_it_all/src/features/product/presentation/product_page.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';
import '../../../common_widgets/my_dialog_box.dart';
import '../../../common_widgets/product_list_header.dart';
import '../../../common_widgets/show_snack_bar.dart';
import '../../../constants/color_constants.dart';
import '../../cart/presentation/controller/cart_page_controller.dart';
import '../../cart/presentation/controller/item_controller.dart';
import '../../wishlist/presentation/controller/wish_list_page_controller.dart';
import '../data/repository/local/local_product_repository.dart';

class DealSection extends StatelessWidget {
  const DealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductListHeader(
          titleList: 'Deals',
          text: 'See all',
          onHeader: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SeeAllPage(titleText: 'Deals', sliverImage: 'assets/images/random_images/Elevate your lifestyle.jpg',)
                )
            );
          },
        ),
        const HorizontalGridList(),
      ],
    );
  }
}

class HorizontalGridList extends ConsumerWidget {
  const HorizontalGridList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productQuantities = ref.watch(itemControllerProvider).value ?? {};
    final productCartState = ref.watch(cartPageControllerProvider.notifier);
    final providerFetchProduct = ref.watch(fetchProductProvider);
    final likeItState = ref.watch(wishListPageControllerProvider);
    return AsyncValueWidget<List<ProductModel>>(
        value: providerFetchProduct,
        data: (gridProduct) => Container(
          margin: pdHor10,
          height: 550,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gridProduct.length,
            padding: pdAll5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 1, // Aspect ratio of each item
            ),
            itemBuilder: (BuildContext context, int index) {
              final gridData = gridProduct[index];
              final selectedItems = likeItState.value ?? []; // Extract state safely
              final isSelected = selectedItems.contains(gridData);
              final quantity = productQuantities[gridData.productId] ?? 1;
              final cardColor = cardColors[index % 4];
              return ProductCard(
                productModel: gridData,
                cardHeight: 140,
                cardColor: cardColor,
                isAllowed: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductPage(
                            backColor: cardColor,
                            topProduct: gridData,
                            addToCart: () {
                              final updatedProduct = gridData.copyWith(quantity: quantity);
                              productCartState.addToCart(updatedProduct);
                              showSnackBar(context, '${updatedProduct.productName} is added to cart', 'assets/images/random_images/correct.png');
                              Navigator.of(context).pop();
                              },
                            onQuantityChanged: (int value) {
                              final listUpdate = gridData.copyWith(quantity: quantity);
                              productCartState.addToCart(listUpdate);
                              },
                          ),
                    ),
                  );
                },
                onLike: () async {
                  await ref
                      .read(wishListPageControllerProvider.notifier)
                      .toggleProductInWishList(gridData);
                },
                likeIcon: Icon(isSelected ? Icons.favorite : Icons.favorite_border),
              );
            },
          ),
        ),
    );
  }
}

