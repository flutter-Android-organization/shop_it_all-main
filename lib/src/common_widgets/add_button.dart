import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {super.key,
      required this.onWish,
      this.wishIcon,
      required this.wishText,
      this.iconToImage = true,
      this.wishImage = '',
      this.btnBackground,
      this.txtColor = Colors.black});

  final VoidCallback onWish;
  final IconData? wishIcon;
  final String wishText;
  final bool iconToImage;
  final String wishImage;
  final Color? btnBackground;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onWish,
        style: OutlinedButton.styleFrom(
            backgroundColor: btnBackground,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: btnColor),
                borderRadius: BorderRadius.circular(5))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconToImage)
              Icon(
                wishIcon,
                color: txtColor,
              )
            else
              Image.asset(
                wishImage,
                height: 20,
                width: 20,
              ),
            gbWd10,
            Text(
              wishText,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: txtColor),
            )
          ],
        ));
  }
}

class BlackAddButton extends StatelessWidget {
  const BlackAddButton(
      {super.key, required this.toCart, required this.addText});

  final VoidCallback toCart;
  final String addText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: btnColor,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: btnColor),
                borderRadius: BorderRadius.circular(5))),
        onPressed: toCart,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              addText,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

class ChangeTextButton extends StatelessWidget {
  const ChangeTextButton(
      {super.key,
      required this.onChangeText,
      required this.changeText,
      this.txtBtnColor = Colors.blue});

  final VoidCallback onChangeText;
  final String changeText;
  final Color? txtBtnColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            overlayColor: Colors.blue,
            elevation: 4.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onChangeText,
        child: Text(
          changeText,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationThickness: 2.0,
            color: txtBtnColor,
            fontSize: 14,
          ),
        ));
  }
}
