import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/see_all_button.dart';
import '../constants/padding_constants.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader(
      {super.key,
      required this.titleList,
      required this.text,
      required this.onHeader, this.sellAllKey});

  final String titleList;
  final String text;
  final VoidCallback onHeader;
  final Key? sellAllKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pdHor10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titleList,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SeeAllButton(
            key: sellAllKey,
            onSeeAll: onHeader,
            text: text,
          )
        ],
      ),
    );
  }
}
