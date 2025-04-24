import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/common_widgets/page_title.dart';
import 'package:shop_it_all/src/common_widgets/scrollable_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/profile/presentation/profile_image.dart';
import 'package:shop_it_all/src/features/profile/presentation/setting_list.dart';

import '../../../common_widgets/horizontal_product_list.dart';
import 'account_list.dart';
import 'my_interest_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const ScrollableWidget(children: [
      gbHt30,
      ProfileImage(),
      gbHt20,
      HorizontalBar(barMargin: pdHor10,),
      gbHt20,
      MyInterestList(),
      gbHt20,
      HorizontalBar(barMargin: pdHor10,),
      SettingList(),
      HorizontalBar(barMargin: pdHor10,),
      gbHt10,
      AccountList(),
      gbHt10,
      ProfileItemList(),
      gbHt30
    ]);
  }
}
