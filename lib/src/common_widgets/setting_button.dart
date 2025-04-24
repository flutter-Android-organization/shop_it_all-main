import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  const SettingButton({super.key, required this.onSetting, required this.settingIcon, required this.settingText});

  final VoidCallback onSetting;
  final IconData settingIcon;
  final String settingText;

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(),
        onPressed: widget.onSetting,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.settingIcon,
                color: Colors.black,
              ),
              const SizedBox(width: 10,),
              Text(
                widget.settingText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16
                ),
              ),
            ],
          ),
        )
    );
  }
}
