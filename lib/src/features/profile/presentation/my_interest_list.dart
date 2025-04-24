import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/product_list_header.dart';
import 'package:shop_it_all/src/common_widgets/single_item_container.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class MyInterestList extends StatelessWidget {
  const MyInterestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pdHor10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductListHeader(
            sellAllKey: ShopItKeys.interestEditBtnKey,
            titleList: 'My Interest',
            text: 'Edit',
            onHeader: () => context.goNamed(RouteNames.editInterest.name),
          ),
          InterestContent(
            onInterest: () => context.goNamed(RouteNames.interest.name),
          )
        ],
      ),
    );
  }
}

class InterestContent extends StatelessWidget {
  const InterestContent({super.key, required this.onInterest});

  final VoidCallback onInterest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleItemContainer(
          onContainerClick: onInterest,
          height: 150,
          containText: 'Sport',
          assetName: 'assets/images/random_images/all_sport.png',
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SingleItemContainer(
              key: ShopItKeys.singleContainerKey,
              onContainerClick: onInterest,
              height: 150,
              containText: 'Gaming',
              assetName: 'assets/images/category_images/gaming.jpg',
            )),
            Expanded(
                child: SingleItemContainer(
              onContainerClick: onInterest,
              height: 150,
              containText: 'Music',
              assetName: 'assets/images/random_images/music.png',
            ))
          ],
        )
      ],
    );
  }
}
