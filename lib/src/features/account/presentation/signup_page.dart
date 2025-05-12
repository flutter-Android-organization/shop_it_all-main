import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/input_text_widget.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import '../../../constants/content_gaps_constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.signupEmailController, required this.signupPasswordController});

  final TextEditingController signupEmailController;
  final TextEditingController signupPasswordController;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool seen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputTextWidget(
          key: ShopItKeys.emailFieldKey,
          inputIcon: Icons.email_outlined,
          inputText: 'Enter Your Email',
          inputHelper: 'Email',
          obscure: false,
          fieldController: widget.signupEmailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            }

            return null;
          },
        ),
        gbHt20,
        InputTextWidget(
          key: ShopItKeys.passwordFieldKey,
          inputIcon: Icons.password,
          inputText: 'Enter a Password',
          inputHelper: 'Password',
          obscure: seen,
          inputSuffix: seen ? Icons.visibility_off_outlined : Icons.visibility_outlined ,
          suffixClick: () => setState(() {
            seen = !seen;
          }),
          fieldController: widget.signupPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
