import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/empty_placeholder_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/features/account/presentation/change_between_login_signup.dart';
import 'package:shop_it_all/src/features/introduction/presentation/intro_layout_widget.dart';
import 'package:shop_it_all/src/features/introduction/presentation/skip_direction.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

class CakePage extends StatelessWidget {
  const CakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CakePageBody(),
    );
  }
}

class CakePageBody extends StatelessWidget {
  const CakePageBody({super.key});

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
                  'assets/images/random_images/Illustration(1).png',
                  height: 250,
                ),
                gbHt20,
                Text(
                  'You can have your cake and eat it too.',
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
                  'No fees, free shipping and amazing customer service. We’ll get you your package within 2 business days no questions asked!',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ],
            )),
            gbHt40,
            BlackAddButton(
                toCart: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeBetweenLoginSignup(
                              initialViewIsLogin: false,
                            ))),
                addText: 'Sign me up!'),
            gbHt20,
            ChangeTextButton(
                key: ShopItKeys.goToAccountKey,
                onChangeText: () => context.goNamed(RouteNames.account.name),
                changeText: 'Already have an account?'),
            gbHt30
          ]),
    );
  }
}
