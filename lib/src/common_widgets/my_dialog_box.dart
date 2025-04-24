import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

Future<Future<Object?>> myDialogBox(BuildContext context,
    {String dialogText = 'Feature Not Implemented.',
    VoidCallback? onDialogueClick,
    VoidCallback? onDialogClick,
    String btnTextOne = 'No',
    String btnTextTwo = 'Okay',
    bool show = false}) async {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ).drive(Tween<Offset>(
          begin: const Offset(0, -1.0),
          end: Offset.zero,
        )),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          icon: const Icon(
            Icons.info_outline,
            size: 60,
            color: Colors.blue,
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Text(
              dialogText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          actions: show
              ? [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (show == true)
                        TextButton(
                          onPressed: onDialogClick ??
                              () => Navigator.of(context).pop(),
                          child: Text(
                            btnTextOne,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      TextButton(
                        onPressed: onDialogueClick ??
                            () => Navigator.of(context).pop(),
                        child: Text(
                          btnTextTwo,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ]
              : [
                  TextButton(
                    onPressed:
                        onDialogueClick ?? () => Navigator.of(context).pop(),
                    child: Text(
                      btnTextTwo,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]
      );
    },
  );
}
