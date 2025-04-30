import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/setting_button.dart';
import 'package:shop_it_all/src/common_widgets/show_snack_bar.dart';

import '../features/account/presentation/controller/current_user_controller.dart';
import '../routes/route_names.dart';
import 'my_dialog_box.dart';

class IconMenuButton extends ConsumerWidget {
  const IconMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(currentUserControllerProvider).value != null;
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert), // Three dots icon
      onSelected: (value) {
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'logout/login',
          child: isAuth ? SettingButton(
        onSetting: () async {
      final logSuccess = await ref
          .watch(currentUserControllerProvider.notifier)
          .isLoggedIn();
      if (logSuccess) {
        myDialogBox(context,
            dialogText: 'Are you sure you want to logout? ',
            show: true,
            btnTextTwo: 'yes', onDialogueClick: () async {
              await ref
                  .read(currentUserControllerProvider.notifier)
                  .logOut();
              context.goNamed(RouteNames.account.name);
              showSnackBar(context, 'Logged out successfully',
                  'assets/images/random_images/correct.png');
            });
      } else {
        showSnackBar(context, 'You have not logged in!',
            'assets/images/random_images/error.png');
      }
    },
    settingIcon: Icons.logout_rounded,
    settingText: 'Logout')
        : SettingButton(
    onSetting: () {
    context.goNamed(RouteNames.account.name);
    },
    settingIcon: Icons.login_outlined,
    settingText: 'Sign in'),
        ),
      ],
    );
  }
}

