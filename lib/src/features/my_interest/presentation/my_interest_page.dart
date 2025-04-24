import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/scrollable_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/home/presentation/deal_section.dart';
import '../../home/presentation/just_you_sec.dart';
import '../../profile/presentation/my_interest_list.dart';

class MyInterestPage extends StatefulWidget {
  const MyInterestPage({super.key});

  @override
  State<MyInterestPage> createState() => _MyInterestPageState();
}

class _MyInterestPageState extends State<MyInterestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Interest',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const MyInterestBody(),
    );
  }
}

class MyInterestBody extends StatelessWidget {
  const MyInterestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollableWidget(children: [
      JustYouSec(titleList: 'Discover new products', text: 'See all',),
      gbHt10,
      MyInterestList(),
      gbHt20,
      DealSection()
    ]);
  }
}
