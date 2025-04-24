import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.customText,
      required this.customSubText,
      required this.customImage,
      this.customIcon,
      this.customIconChange = true});

  final String customText;
  final String customSubText;
  final String customImage;
  final IconData? customIcon;
  final bool customIconChange;

  @override
  Size get preferredSize => const Size.fromHeight(60); // kToolbarHeight

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage:
              AssetImage(customImage), // Change to NetworkImage if needed
          radius: 20,
        ),
      ),
      title: customIconChange
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customText,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text(customSubText,
                    style: TextStyle(color: Colors.green, fontSize: 14)),
              ],
            )
          : Text(customText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
      actions: [
        if (customIconChange)
          IconButton(
            icon: Icon(customIcon, color: Colors.black),
            onPressed: () {},
          )
      ],
    );
  }
}
