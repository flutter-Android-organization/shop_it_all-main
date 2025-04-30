import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/introduction/presentation/skip_direction.dart';

import '../../../common_widgets/add_button.dart';
import '../../../constants/content_gaps_constants.dart';
import '../../../routes/route_names.dart';

class WorkWithPage extends StatelessWidget {
  const WorkWithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorkWithPageBody(),
    );
  }
}

class WorkWithPageBody extends StatelessWidget {
  const WorkWithPageBody({super.key});

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
                  'assets/images/random_images/Illustration.png',
                  height: 250,
                ),
                gbHt20,
                Text(
                  'Your interests working with you.',
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
                  'Tell us what you like. No, really, it helps a bunch when we serve you some great products. You just keep doing your thing.',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ],
            )),
            gbHt40,
            BlackAddButton(
                toCart: () => context.goNamed(RouteNames.cake.name),
                addText: 'Next'),
            gbHt30
          ]),
    );
  }
}
