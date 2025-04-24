import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/color_card.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/home/data/repository/local/local_category_repository.dart';
import 'package:shop_it_all/src/features/home/domain/category_model.dart';
import 'package:shop_it_all/src/features/home/presentation/category_see_all.dart';
import 'package:shop_it_all/src/utils/async_value_widget.dart';
import '../../../common_widgets/my_dialog_box.dart';
import '../../../common_widgets/product_list_header.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

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
              titleList: 'Categories',
              text: 'See all',
              onHeader: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategorySeeAll()));
              },
            ),
            const HorizontalCategoryList()
          ],
        ),
      ),
    );
  }
}

class HorizontalCategoryList extends ConsumerWidget {
  const HorizontalCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerFetchCategory = ref.watch(fetchCategoriesProvider);
    return AsyncValueWidget<List<CategoryModel>>(
        value: providerFetchCategory,
        data: (categoryData) => Container(
              margin: pdHor10,
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (BuildContext context, int index) {
                  final cat = categoryData[index];
                  return ColorCard(
                      onTap: () {},
                      categoryModel: cat
                  );
                },
              ),
            )
    );
  }
}
