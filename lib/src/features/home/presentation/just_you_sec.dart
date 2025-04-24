import 'package:flutter/material.dart';
import 'package:shop_it_all/src/features/home/presentation/see_all_page.dart';
import '../../../common_widgets/horizontal_product_list.dart';
import '../../../common_widgets/my_dialog_box.dart';
import '../../../common_widgets/product_list_header.dart';

class JustYouSec extends StatelessWidget {
  const JustYouSec({super.key, required this.titleList, required this.text});

  final String titleList;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductListHeader(
              titleList: titleList,
              text: text,
              onHeader: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllPage(
                              titleText: titleList,
                              sliverImage:
                                  'assets/images/random_images/eCommerce Business Models_ Type, Benefits & Examples.jpg',
                            )));
              },
            ),
            const HorizontalProductList(
              isAllowed: true,
            )
          ],
        ),
      ),
    );
  }
}
