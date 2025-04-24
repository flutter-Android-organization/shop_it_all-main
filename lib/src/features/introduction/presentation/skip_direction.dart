import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/add_button.dart';
import '../../../routes/route_names.dart';

class SkipDirection extends StatelessWidget {
  const SkipDirection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChangeTextButton(
          onChangeText: () => context.goNamed(RouteNames.account.name),
          changeText: 'Skip',
          txtBtnColor: Colors.grey,
        )
      ],
    );
  }
}
