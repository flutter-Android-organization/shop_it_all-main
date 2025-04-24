import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

void showAutoDismissDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      Future.delayed(const Duration(seconds: 5), () {
        if (dialogContext.mounted) {
          Navigator.of(dialogContext).pop(); // Close the dialog
          if (context.mounted) {
            Navigator.of(context).pop(); // Pop the screen
          }
        }
      });

      return AlertDialog(
        backgroundColor: Colors.transparent,
        //title: const Text("Processing"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/random_images/bye.png',
              width: 200,
              height: 200,
            ),
            gbHt20,
            const Text(
              "Thanks for shopping with us",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            gbHt20,
            const CircularProgressIndicator()
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );
    },
  );
}