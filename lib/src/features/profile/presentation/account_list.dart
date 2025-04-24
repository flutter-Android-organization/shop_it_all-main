import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/product_list_header.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import '../../../common_widgets/horizontal_product_list.dart';
import '../../../common_widgets/my_dialog_box.dart';
import '../../home/presentation/category_section.dart';

class AccountList extends StatelessWidget {
  const AccountList({super.key});

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
            titleList: 'Account Details',
            text: 'Edit',
            onHeader: () {
              myDialogBox(context);
            },
          ),
          const HorizontalCategoryList()
        ],
      ),
    );
  }
}

class ProfileItemList extends StatelessWidget {
  const ProfileItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pd1All0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductListHeader(
            titleList: 'Profile store',
            text: 'See all',
            onHeader: () {
              myDialogBox(context);
            },
          ),
          gbHt10,
          const HorizontalProductList(isAllowed: true)
        ],
      ),
    );
  }
}
