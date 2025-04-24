import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WrappedRowButtons extends StatelessWidget {
  WrappedRowButtons({super.key});

  final List<String> buttonLabels = [
    'Settings',
    'Messages',
    'Notifications',
    'Friends',
    'Gallery',
    'Help'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0, // Horizontal spacing
      runSpacing: 5.0, // Vertical spacing
      children: buttonLabels.map((label) {
        return ElevatedButton(
          onPressed: () {
            if (kDebugMode) {
              print('$label clicked');
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_circle_outline),
                color: Colors.white,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
