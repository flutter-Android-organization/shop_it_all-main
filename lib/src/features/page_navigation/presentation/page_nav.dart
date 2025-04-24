import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/bottom_navigation.dart';
import 'package:shop_it_all/src/features/page_navigation/data/repository/navigation_repository.dart';

import '../data/local/app_bar_details.dart';

class PageNav extends ConsumerStatefulWidget {
  const PageNav({super.key});

  @override
  ConsumerState createState() => _PageNavState();
}

class _PageNavState extends ConsumerState<PageNav> {
  int _selectItem = 0;

  void _onItemClick(int value) {
    setState(() {
      _selectItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = ref.read(navigationRepositoryProvider).pages();
    return Scaffold(
      appBar: AppBarDetails.appBarData[_selectItem],
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: pageProvider[_selectItem], //PageDetails.pageData[_selectItem],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: _selectItem, onItemTap: _onItemClick)//BottomNavigation(selectedItem: _selectItem, onItemTap: _onItemClick),
    );
  }
}

