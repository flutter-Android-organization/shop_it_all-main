import 'package:flutter/material.dart';

import '../constants/content_gaps_constants.dart';

class SliverTopBar extends StatelessWidget {
  const SliverTopBar({super.key, required this.titleText, required this.sliverImage});

  final String titleText;
  final String sliverImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(10.0),
        title: Row(
          children: [
            gbWd40,
            const CircleAvatar(
              radius: 16,
              backgroundImage:
              AssetImage('assets/images/random_images/huston.jpg'),
            ),
            const SizedBox(width: 10),
            Text(
              titleText,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        background: Image.asset(
          sliverImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
