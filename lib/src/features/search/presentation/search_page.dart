import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/search/presentation/search_controller.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/wish_product_list.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';

import '../../../common_widgets/show_snack_bar.dart';
import '../../../common_widgets/unavailable_item_widget.dart';
import '../../cart/presentation/controller/cart_page_controller.dart';
import '../../cart/presentation/controller/item_controller.dart';
import '../../product/presentation/product_page.dart';
import '../../wishlist/presentation/controller/wish_list_page_controller.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key, required this.searchedItem});

  final String searchedItem;

  @override
  ConsumerState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final productQuantities = ref.watch(itemControllerProvider).value ?? {};
    final productCartState = ref.read(cartPageControllerProvider.notifier);
    final searchState = ref.watch(searchControllerProvider);
    final wishState = ref.watch(wishListPageControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Searched for "${widget.searchedItem}"'),
        ),
        body: SingleChildScrollView(
          padding: pd1All0,
          child: AsyncValueWidget(
              value: searchState,
              data: (searchList) {
                if (searchList.isEmpty) {
                  return const UnavailableItemWidget(
                      unavailableText: 'No search query');
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: searchList.map((searchData) {
                    final selectedItems =
                        wishState.value ?? []; // Extract state safely
                    final isSelected =
                    selectedItems.contains(searchData);
                    final quantity =
                        productQuantities[searchData.productId] ?? 1;
                    return ProductItem(
                      itemList: searchData,
                      toCart: () async {
                        await ref
                            .read(wishListPageControllerProvider.notifier)
                            .toggleProductInWishList(searchData);
                      },
                      onTem: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            topProduct: searchData,
                            addToCart: () {
                              final updatedProduct =
                                  searchData.copyWith(quantity: quantity);
                              productCartState.addToCart(updatedProduct);
                              showSnackBar(
                                  context,
                                  '${updatedProduct.productName} is added to cart',
                                  'assets/images/random_images/correct.png');
                              Navigator.of(context).pop();
                            },
                            onQuantityChanged: (int value) {
                              final listUpdate =
                                  searchData.copyWith(quantity: quantity);
                              productCartState.addToCart(listUpdate);
                            },
                          ),
                        ),
                      ),
                      cartIcon:  Icon(
                          isSelected ? Icons.favorite : Icons.favorite_border),
                    );
                  }).toList(),
                );
              }),
        ));
  }
}
