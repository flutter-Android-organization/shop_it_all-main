import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

class AvatarImageHeader extends StatelessWidget {
  const AvatarImageHeader({super.key, required this.avatarImage, required this.avatarText});

  final String avatarImage;
  final String avatarText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(avatarImage),
          radius: 20.0,
        ),
        gbWd20,
        Text(
          avatarText,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
