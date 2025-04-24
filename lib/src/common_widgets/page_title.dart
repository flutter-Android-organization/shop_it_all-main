import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.titleText});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
