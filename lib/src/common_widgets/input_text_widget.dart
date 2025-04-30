import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {super.key,
      required this.fieldController,
      required this.inputHelper,
      required this.inputIcon,
      required this.inputText,
      required this.obscure,
      this.inputSuffix,
      this.suffixClick,
      this.validator});

  final TextEditingController fieldController;
  final String inputHelper;
  final IconData inputIcon;
  final String inputText;
  final bool obscure;
  final IconData? inputSuffix;
  final VoidCallback? suffixClick;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: fieldController,
        decoration: InputDecoration(
            helperText: inputHelper,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.blue),
                borderRadius: BorderRadius.circular(5)),
            hintText: inputText,
            prefixIcon: Icon(inputIcon),
            suffixIcon: IconButton(
              highlightColor: Colors.blue,
              onPressed: suffixClick,
              icon: Icon(inputSuffix),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide())),
        obscureText: obscure,
        validator: validator);
  }
}
