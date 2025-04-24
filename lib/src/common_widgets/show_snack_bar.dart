import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

void showSnackBar(BuildContext context, String snackText, String snackImage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 4.0,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            snackImage,
            height: 30,
            width: 30,
          ),
          gbWd10,
          Expanded(child: Text(snackText, overflow: TextOverflow.ellipsis,)), // Ensure text doesn't overflow
        ],
      ),
      duration: Duration(seconds: 3),
    ),
  );
}
