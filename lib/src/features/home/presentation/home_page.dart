import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/home/presentation/category_section.dart';
import 'package:shop_it_all/src/features/home/presentation/deal_section.dart';
import 'package:shop_it_all/src/features/home/presentation/just_you_sec.dart';
import 'package:shop_it_all/src/features/search/presentation/search_section.dart';

import '../../../common_widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child:  Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gbHt30,
          SearchSection(),
          gbHt10,
          JustYouSec(titleList: 'Just for you', text: 'See all',),
          gbHt20,
          DealSection(),
          gbHt20,
          CategorySection(),
          gbHt30
        ],
      ),
    );
  }
}


/// TODO WishList Should be Activated