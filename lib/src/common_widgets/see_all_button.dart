import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, required this.onSeeAll, required this.text});

  final VoidCallback onSeeAll;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onSeeAll,
        child: Text(text, style: const TextStyle(color: Colors.green),)
    );
  }
}
