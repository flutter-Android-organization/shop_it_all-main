import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/color_card.dart';
import 'package:shop_it_all/src/common_widgets/search_field.dart';
import 'package:shop_it_all/src/common_widgets/wrapped_row_buttons.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/edit_interest/presentation/edit_interest_controller.dart';
import 'package:shop_it_all/src/features/home/data/repository/local/local_category_repository.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../common_widgets/product_card.dart';
import '../../../common_widgets/unavailable_item_widget.dart';
import '../../home/data/repository/local/local_product_repository.dart';
import '../../wishlist/presentation/controller/wish_list_page_controller.dart';

class EditInterestPage extends ConsumerStatefulWidget {
  const EditInterestPage({super.key});

  @override
  ConsumerState createState() => _EditInterestPageState();
}

class _EditInterestPageState extends ConsumerState<EditInterestPage> {
  final TextEditingController _searchEditController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchEditController.addListener(_onEditChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchEditController.removeListener(_onEditChanged);
    _searchEditController.dispose();
    super.dispose();
  }

  void _onEditChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref
          .read(editInterestControllerProvider.notifier)
          .editSearch(_searchEditController.text);
    });
    setState(() {}); // Trigger rebuild when text changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Interest',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            padding: pd1All0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WrappedRowButtons(),
                const Text(
                  'Add new interest',
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                gbHt10,
                SearchField(
                  searchController: _searchEditController,
                  searchText: 'Find your Interest',
                  suffixIcon: _searchEditController.text.isNotEmpty
                      ? SearchButton(onSearch: () {})
                      : null,
                ),
              ],
            ),
          ),
          const Expanded(child: InterestGridList())
        ],
      ),
    );
  }
}

class InterestGridList extends ConsumerWidget {
  const InterestGridList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(editInterestControllerProvider);
    return AsyncValueWidget(
        value: categoryState,
        data: (catData) {
          if(catData.isEmpty) {
            return const UnavailableItemWidget(
                unavailableText: 'There is no such category');
          }
          return FutureBuilder<bool>(
              future: Future.delayed(const Duration(seconds: 2), () => false),
              builder: (context, snapshot) {
                final showShimmer = snapshot.data ?? true;

                return Skeletonizer(
                  enabled: showShimmer,
                  ignorePointers: false,
                  effect: const ShimmerEffect(duration: Duration(seconds: 2)),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: catData.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return ColorCard(
                            onTap: () {}, categoryModel: catData[index]);
                      }),
                );
              });
        }
    );
  }
}

// class HorizontalGridList extends ConsumerWidget {
//   const HorizontalGridList({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final likeItState = ref.watch(wishListPageControllerProvider);
//     final providerFetchProduct = ref.watch(fetchProductProvider);
//     return AsyncValueWidget(
//         value: providerFetchProduct,
//         data: (gridProduct) => Container(
//           margin: pdHor10,
//           height: 450,
//           child: GridView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: gridProduct.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // Number of columns
//               childAspectRatio: 1, // Aspect ratio of each item
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               final gridData = gridProduct[index];
//               final selectedItems = likeItState.value ?? []; // Extract state safely
//               final isSelected = selectedItems.contains(gridData); // Check if selected
//               return ProductCard(
//                 productModel: gridData,
//                 isAllowed: false,
//                 onTap: () {},
//                 onLike: () async {
//                   await ref
//                       .read(wishListPageControllerProvider.notifier)
//                       .toggleProductInWishList(gridData);
//                 },
//                 likeIcon: Icon(isSelected ? Icons.favorite : Icons.favorite_border),
//               );
//             },
//           ),
//         ),
//     );
//   }
// }
