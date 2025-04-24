import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({super.key, required this.barMargin});

  final EdgeInsetsGeometry barMargin;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: barMargin,
      height: 2, // Thickness of the bar
      width: double.infinity, // Full width
      color: Colors.grey, // Color of the bar
    );
  }
}
