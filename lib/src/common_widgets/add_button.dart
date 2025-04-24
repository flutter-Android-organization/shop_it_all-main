import 'package:flutter/material.dart';
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
    return OutlinedButton(
        onPressed: onWish,
        style: OutlinedButton.styleFrom(
            backgroundColor: btnBackground,
            elevation: 4.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
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
  const BlackAddButton({super.key, required this.toCart});

  final VoidCallback toCart;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: toCart,
        child: const Text(
          'Add to cart',
          style: TextStyle(fontSize: 14),
        ));
  }
}

class ChangeTextButton extends StatelessWidget {
  const ChangeTextButton(
      {super.key,
      required this.onChangeText,
      required this.changeText,
      this.txtBtnColor = Colors.black});

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
            color: txtBtnColor,
            fontSize: 14,
          ),
        ));
  }
}
