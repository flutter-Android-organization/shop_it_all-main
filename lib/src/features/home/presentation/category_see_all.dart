import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/color_card.dart';
import '../../../common_widgets/sliver_top_bar.dart';
import '../../../common_widgets/unavailable_item_widget.dart';
import '../../../constants/content_gaps_constants.dart';
import '../../../utils/async_value_widget.dart';
import '../../edit_interest/presentation/edit_interest_controller.dart';
import '../domain/category_model.dart';

class CategorySeeAll extends ConsumerStatefulWidget {
  const CategorySeeAll({super.key});

  @override
  ConsumerState createState() => _CategorySeeAllState();
}

class _CategorySeeAllState extends ConsumerState<CategorySeeAll> {
  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(editInterestControllerProvider);
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(10.0),
        title: Row(
          children: [
            gbWd40,
            const CircleAvatar(
              radius: 16,
              backgroundImage:
                  AssetImage('assets/images/random_images/huston.jpg'),
            ),
            const SizedBox(width: 10),
            Text(
              'Categories',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )),
      body: AsyncValueWidget(
          value: categoryState,
          data: (catData) {
            if (catData.isEmpty) {
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
          }),
    );
  }
}

// class CategorySeeAll extends ConsumerStatefulWidget {
//   const CategorySeeAll({super.key});
//
//   @override
//   ConsumerState<CategorySeeAll> createState() => _CategorySeeAllState();
// }
//
// class _CategorySeeAllState extends ConsumerState<CategorySeeAll> {
//   @override
//   Widget build(BuildContext context) {
//     final categoryState = ref.watch(editInterestControllerProvider);
//
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverTopBar(titleText: 'Categories', sliverImage: ''),
//           const SliverToBoxAdapter(child: SizedBox(height: 16)),
//           AsyncValueWidget(
//               value: categoryState,
//               data: (categoryData) {
//                 if (categoryData.isEmpty) {
//                   return SliverFillRemaining(
//                     child: UnavailableItemWidget(
//                       unavailableText: 'No categories available',
//                     ),
//                   );
//                 }
//
//                 return SliverFillRemaining();
//               }
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBody(AsyncValue<List<CategoryModel>> categoryState) {
//     return CustomScrollView(slivers: [
//       const SliverToBoxAdapter(child: SizedBox(height: 16)),
//       SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           sliver: AsyncValueWidget(
//               value: categoryState,
//               data: (categoryData) {
//                 if (categoryData.isEmpty) {
//                   return SliverFillRemaining(
//                     child: UnavailableItemWidget(
//                       unavailableText: 'No categories available',
//                     ),
//                   );
//                 }
//                 return _buildCategoryGrid(categoryData);
//               }))
//     ]);
//   }
//
//   Widget _buildShimmerGrid(List<CategoryModel> catMembers) {
//     return SliverGrid(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1,
//         mainAxisSpacing: 16,
//         crossAxisSpacing: 16,
//       ),
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           final shimmerMember = catMembers[index];
//           return Skeletonizer(
//             enabled: true,
//             child: ColorCard(
//               categoryModel: shimmerMember,
//               onTap: () {},
//             ),
//           );
//         },
//         childCount: catMembers.length,
//       ),
//     );
//   }
//
//   Widget _buildCategoryGrid(List<CategoryModel> categories) {
//     return SliverGrid(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1,
//         mainAxisSpacing: 16,
//         crossAxisSpacing: 16,
//       ),
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           final category = categories[index];
//           return ColorCard(
//             onTap: () => _handleCategoryTap(category),
//             categoryModel: category,
//           );
//         },
//         childCount: categories.length,
//       ),
//     );
//   }
//
//   void _handleCategoryTap(CategoryModel category) {
//     // Add your navigation logic here
//     // Example:
//     // context.pushNamed(RouteNames.categoryDetails, extra: category);
//   }
// }
//
