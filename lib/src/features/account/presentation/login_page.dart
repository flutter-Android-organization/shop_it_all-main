import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/common_widgets/input_text_widget.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key,
      required this.loginEmailController,
      required this.loginPasswordController});

  final TextEditingController loginEmailController;
  final TextEditingController loginPasswordController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool seen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputTextWidget(
          key: ShopItKeys.emailInputKey,
          inputIcon: Icons.email_outlined,
          inputText: 'Enter Your Email',
          inputHelper: 'Email',
          obscure: false,
          fieldController: widget.loginEmailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        gbHt20,
        InputTextWidget(
          key: ShopItKeys.passwordInputKey,
          inputIcon: Icons.password,
          inputText: 'Enter Your Password',
          inputHelper: 'Password',
          obscure: seen,
          inputSuffix: seen
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          suffixClick: () => setState(() {
            seen = !seen;
          }),
          fieldController: widget.loginPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
        gbHt5,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChangeTextButton(
                onChangeText: () {}, changeText: 'Forgot Password?')
          ],
        ),
      ],
    );
  }
}

class HorizontalOr extends StatelessWidget {
  const HorizontalOr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: HorizontalBar(barMargin: pdAll),
        ),
        gbWd10,
        Text(
          'Or',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        gbWd10,
        Expanded(
          child: HorizontalBar(barMargin: pdAll),
        )
      ],
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [],
    );
  }
}
