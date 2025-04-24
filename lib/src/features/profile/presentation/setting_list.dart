import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/common_widgets/my_dialog_box.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/features/account/data/repository/auth_repository.dart';
import 'package:shop_it_all/src/features/account/presentation/controller/auth_controller.dart';
import 'package:shop_it_all/src/routes/route_names.dart';
import '../../../common_widgets/setting_button.dart';
import '../../../common_widgets/show_snack_bar.dart';
import '../../account/presentation/controller/current_user_controller.dart';

class SettingList extends ConsumerWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: pd1All0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.security_rounded,
              settingText: 'Security Setting'),
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.account_circle_outlined,
              settingText: 'Profile Information'),
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.notifications_none_rounded,
              settingText: 'Notification Setting'),
          gbHt5,
          const HorizontalBar(barMargin: pdAll),
          gbHt5,
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.quick_contacts_mail_outlined,
              settingText: 'KYC Information'),
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.insert_drive_file_outlined,
              settingText: 'My Document'),
          gbHt5,
          const HorizontalBar(barMargin: pdAll),
          gbHt5,
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.update,
              settingText: 'Check for Updates'),
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.star_rate_outlined,
              settingText: 'Rate App'),
          gbHt5,
          const HorizontalBar(barMargin: pdAll),
          gbHt5,
          SettingButton(
              onSetting: () {},
              settingIcon: Icons.person_outline_rounded,
              settingText: 'Manage Account'),
          SettingButton(
              onSetting: () async {
                final logSuccess = await ref.watch(currentUserControllerProvider.notifier).isLoggedIn();
                if (logSuccess) {
                  myDialogBox(context,
                      dialogText: 'Are you sure you want to logout? ',
                      show: true,
                      btnTextTwo: 'yes',
                      onDialogueClick: () async {
                    await ref.read(currentUserControllerProvider.notifier).logOut();
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
        ],
      ),
    );
  }
}
