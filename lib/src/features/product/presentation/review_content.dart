import 'package:flutter/material.dart';
import '../../../common_widgets/add_button.dart';
import '../../../common_widgets/horizontal_bar.dart';
import '../../../common_widgets/horizontal_product_list.dart';
import '../../../constants/content_gaps_constants.dart';
import '../../../constants/padding_constants.dart';
import '../../reviews/presentation/review_widget.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        padding: pdHor10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            gbHt20,
            const Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Reviews',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.blue,
                            blurRadius: 3,
                            offset: Offset(2, 2))
                      ]),
                )
              ],
            ),
            gbHt20,
            const ReviewWidget(),
            const HorizontalBar(
              barMargin: pd1All0,
            ),
            const ReviewWidget(),
            const HorizontalBar(
              barMargin: pd1All0,
            ),
            const ReviewWidget(),
            gbHt20,
            AddButton(
                onWish: () {},
                wishIcon: Icons.unfold_more,
                wishText: 'See more reviews'),
            gbHt20,
            const HorizontalProductList(isAllowed: true),
            gbHt30
          ],
        ),
      ),
    );
  }
}
