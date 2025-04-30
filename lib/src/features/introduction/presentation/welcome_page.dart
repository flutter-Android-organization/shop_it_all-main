import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/introduction/presentation/intro_layout_widget.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroLayoutWidget(
          backImage: 'assets/images/random_images/Images Normal(1).png',
          children: [
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the world\'s largest store',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black),
                ),
              ],
            )),
            gbHt40,
            BlackAddButton(
                toCart: () => context.goNamed(RouteNames.irrelevant.name),
                addText: 'Let\'s begin'),
            gbHt30,
          ]),
    );
  }
}
