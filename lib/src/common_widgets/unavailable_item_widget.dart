import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import '../constants/content_gaps_constants.dart';

class UnavailableItemWidget extends StatelessWidget {
  const UnavailableItemWidget({super.key, required this.unavailableText});

  final String unavailableText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pd1All0,
      child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.no_food_outlined,
                size: 50.0,
                color: Colors.grey,
              ),
              gbHt10,
              Text(
                unavailableText,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    letterSpacing: 3.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              )
            ],
          )
      ),
    );
  }
}
