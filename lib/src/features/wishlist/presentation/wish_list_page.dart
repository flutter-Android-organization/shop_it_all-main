import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_product_list.dart';
import 'package:shop_it_all/src/common_widgets/product_list_header.dart';
import 'package:shop_it_all/src/common_widgets/scrollable_widget.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/controller/wish_list_page_controller.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/wish_product_list.dart';
import '../../../common_widgets/add_button.dart';
import '../../home/presentation/see_all_page.dart';


class WishListPage extends ConsumerStatefulWidget {
  const WishListPage({super.key});

  @override
  ConsumerState createState() => _WishListPageState();
}

class _WishListPageState extends ConsumerState<WishListPage> {
  @override
  Widget build(BuildContext context) {
    final wishProvider = ref.watch(wishListPageControllerProvider.notifier);
    return ScrollableWidget(children: [
      gbHt30,
      WishList(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: AddButton(
          btnBackground: btnColor,
            txtColor: Colors.black,
            onWish: () {
              wishProvider.clearWishlist();
            },
            wishIcon: Icons.playlist_add_rounded,
            wishText: 'Create a new WishList'),
      ),
      ProductListHeader(
        titleList: 'You may also like',
        text: 'See all',
        onHeader: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeeAllPage(
                    titleText: 'You may also like',
                    sliverImage:
                    'assets/images/random_images/eCommerce Business Models_ Type, Benefits & Examples.jpg',
                  )));
        },
      ),
      gbHt10,
      const HorizontalProductList(isAllowed: true),
      gbHt30
    ]);
  }
}
