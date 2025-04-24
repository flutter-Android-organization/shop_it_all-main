import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';

class ExpandableIconButton extends StatefulWidget {
  const ExpandableIconButton(
      {super.key, required this.icon, required this.label, required this.toolTip});

  final IconData icon;
  final String label;
  final String toolTip;

  @override
  State<ExpandableIconButton> createState() => _ExpandableIconButtonState();
}

class _ExpandableIconButtonState extends State<ExpandableIconButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return   IconButton(
        padding: const EdgeInsets.all(5),
        style: IconButton.styleFrom(
          overlayColor: bigBlue,
          hoverColor: bigBlue.withOpacity(0.6),
          padding: const EdgeInsets.all(5),
        ),
        tooltip: widget.toolTip,
        onPressed: () {
          setState(() {
            _isExpanded = !_isExpanded; // Toggle the expanded state
          });
        },
        icon: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(widget.icon, color: Colors.black),
          if (_isExpanded) ...[
            const SizedBox(width: 8), // Space between icon and text
            Text(widget.label,
                style: const TextStyle(color: Colors.black)),
          ],
        ])
    );
  }
}
