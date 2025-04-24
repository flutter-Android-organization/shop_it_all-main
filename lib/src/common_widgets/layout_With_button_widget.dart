import 'package:flutter/material.dart';

class LayoutWithButtonWidget extends StatelessWidget {
  const LayoutWithButtonWidget({super.key, required this.navToAddress, required this.children});

  final VoidCallback navToAddress;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
          IconButton(
              onPressed: navToAddress,
              iconSize: 20.0,
              icon: const Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
    );
  }
}
