import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/filters/presentation/sort_by_list_widget.dart';
import 'categories_list_widget.dart';
import 'format_list_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FilterHeader(),
      body: FilterPageBody(),
      bottomNavigationBar: FilterFooter(),
    );
  }
}

class FilterPageBody extends StatelessWidget {
  const FilterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: pd1All0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SortByListWidget(),
          HorizontalBar(barMargin: pd1All0),
          CategoriesListWidget(),
          HorizontalBar(barMargin: pd1All0),
          FormatListWidget()
        ],
      ),
    );
  }
}

class FilterHeader extends StatelessWidget implements PreferredSizeWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Filter',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FilterFooter extends StatelessWidget {
  const FilterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalBar(barMargin: pdAll),
        gbHt20,
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddButton(
                onWish: () {},
                wishIcon: Icons.cancel_outlined,
                wishText: 'Cancel'),
            gbWd10,
            Expanded(
                child: AddButton(
                    onWish: () {},
                    wishIcon: Icons.visibility_outlined,
                    wishText: 'Show Result'))
          ],
        )
      ],
    );
  }
}
