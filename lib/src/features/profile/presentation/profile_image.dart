import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import '../../../common_widgets/expandable_icon_button.dart';
import '../../account/presentation/controller/current_user_controller.dart';

class ProfileImage extends ConsumerWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(currentUserControllerProvider).value != null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage( isAuth ? 'assets/images/random_images/huston.jpg' : 'assets/images/random_images/profile.png'),
            radius: 100.0,
          ),
        ),
        gbHt10,
        Text(
          isAuth ? 'Samuel Huston' : 'Guest',
          softWrap: true,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        gbHt5,
        Text(
          'Creating a user profile page in Flutter involves several key '
              'concepts, including the use of widgets to structure the layout',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        gbHt10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ExpandableIconButton(
                icon: Icons.add_a_photo_outlined,
                label: 'New Photo',
                toolTip: 'Add Photo'),
            gbHt5,
            Container(
              width: 2, // Thickness of the line
              height: 40, // Height of the line
              color: Colors.grey, // Color of the line
            ),
            gbHt5,
            const ExpandableIconButton(
                icon: Icons.edit_note_rounded,
                label: 'Edit Profile',
                toolTip: 'Edit Photo')
          ],
        )
      ],
    );
  }
}
