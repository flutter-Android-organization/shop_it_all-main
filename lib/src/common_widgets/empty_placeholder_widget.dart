import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/product_card.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pd1All0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gbHt40,
            AddButton(
                onWish: () => context.goNamed(RouteNames.pageNav.name),
                wishIcon: Icons.home_outlined,
                wishText: 'Back Home')
          ],
        ),
      ),
    );
  }
}
