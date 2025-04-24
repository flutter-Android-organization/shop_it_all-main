import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/home/domain/category_model.dart';

class ColorCard extends StatelessWidget {
  const ColorCard(
      {super.key, required this.onTap, required this.categoryModel});

  final VoidCallback onTap;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pdVer10,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: btnColor,
        onTap: onTap,
        child: Column(
          children: [
            Container(
              margin: pdAll5,
              padding: pd1All0,
              clipBehavior: Clip.hardEdge,
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  image: DecorationImage(
                      image: AssetImage(categoryModel.categoryImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(),
            ),
            gbHt5,
            Text(
              categoryModel.categoryText,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,),
            ),

          ],
        )
      ),
    );
  }
}
