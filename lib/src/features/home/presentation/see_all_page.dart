import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/sliver_top_bar.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/wish_product_list.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';

import '../../../common_widgets/show_snack_bar.dart';
import '../../cart/presentation/controller/cart_page_controller.dart';
import '../../cart/presentation/controller/item_controller.dart';
import '../../product/presentation/product_page.dart';
import '../../wishlist/presentation/controller/wish_list_page_controller.dart';
import '../data/repository/local/local_product_repository.dart';

class SeeAllPage extends ConsumerStatefulWidget {
  const SeeAllPage(
      {super.key, required this.titleText, required this.sliverImage});

  final String titleText;
  final String sliverImage;

  @override
  ConsumerState createState() => _SeeAllPageState();
}

class _SeeAllPageState extends ConsumerState<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    final listProvider = ref.watch(fetchProductProvider);
    final productQuantities = ref.watch(itemControllerProvider).value ?? {};
    final productCartState = ref.read(cartPageControllerProvider.notifier);
    final wishState = ref.watch(wishListPageControllerProvider);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverTopBar(
            titleText: widget.titleText, sliverImage: widget.sliverImage),
        SliverPadding(
          padding: pd1All0,
          sliver: AsyncValueWidget(
              value: listProvider,
              data: (listData) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final member = listData[index];
                    final selectedItems =
                        wishState.value ?? []; // Extract state safely
                    final isSelected =
                    selectedItems.contains(member);
                    final quantity = productQuantities[member.productId] ?? 1;
                    return ProductItem(
                        itemList: member,
                        toCart: () async {
                          await ref
                              .read(wishListPageControllerProvider.notifier)
                              .toggleProductInWishList(member);
                        },
                      onTem: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              topProduct: member,
                              addToCart: () {
                                final updatedProduct =
                                member.copyWith(quantity: quantity);
                                productCartState.addToCart(updatedProduct);
                                showSnackBar(
                                    context,
                                    '${updatedProduct.productName} is added to cart',
                                    'assets/images/random_images/correct.png');
                                Navigator.of(context).pop();
                              },
                              onQuantityChanged: (int value) {
                                final listUpdate =
                                member.copyWith(quantity: quantity);
                                productCartState.addToCart(listUpdate);
                              },
                            ),
                          ),
                        );
                      },
                      cartIcon: Icon(
                          isSelected ? Icons.favorite : Icons.favorite_border),);
                  }, childCount: listData.length),
                );
              }),
        ),
      ],
    ));
  }
}
