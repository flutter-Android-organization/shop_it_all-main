import 'package:flutter/material.dart';

import '../../../constants/padding_constants.dart';


class IntroLayoutWidget extends StatelessWidget {
  const IntroLayoutWidget({super.key, required this.children,this.backImage = ''});

  final List<Widget> children;
  final String backImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: pd1All0,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backImage), fit: BoxFit.contain)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
