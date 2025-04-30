import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/common_widgets/icon_menu_button.dart';
import '../features/account/presentation/controller/current_user_controller.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.customText,
    required this.customSubText,
    required this.customImage,
    this.customIconChange = true,
    this.customImageAlt = 'assets/images/random_images/profile.png',
    this.customTextAlt = 'Guest',
  });

  final String customText;
  final String customSubText;
  final String customImage;
  final String customImageAlt;
  final bool customIconChange;
  final String customTextAlt;

  @override
  Size get preferredSize => const Size.fromHeight(60); // kToolbarHeight

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(currentUserControllerProvider).value != null;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage: AssetImage(isAuth
              ? customImage
              : customImageAlt), // Change to NetworkImage if needed
          radius: 20,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isAuth ? customText : customTextAlt,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          if (customIconChange)
            Text(customSubText,
                style: TextStyle(
                    color: isAuth ? Colors.green : Colors.red, fontSize: 14)),
        ],
      ),
    );
  }
}
