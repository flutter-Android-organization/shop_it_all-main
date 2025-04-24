import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/empty_placeholder_widget.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/introduction/presentation/intro_layout_widget.dart';
import 'package:shop_it_all/src/features/introduction/presentation/skip_direction.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class IrrelevantPage extends StatelessWidget {
  const IrrelevantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IrrelevantPageBody(),
    );
  }
}

class IrrelevantPageBody extends StatelessWidget {
  const IrrelevantPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pd1All0,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            gbHt20,
            SkipDirection(),
            gbHt20,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/random_images/Illustration(2).png',
                  height: 250,
                ),
                gbHt20,
                Text(
                  'Irrelevant results again?',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black),
                ),
                gbHt10,
                Text(
                  'Habitual sends you relevant items based off of your habits and interests.',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ],
            )),
            gbHt40,
            AddButton(
              onWish: () => context.goNamed(RouteNames.workWith.name),
              wishText: 'Next',
              btnBackground: btnColor,
            ),
            gbHt30
          ]),
    );
  }
}
