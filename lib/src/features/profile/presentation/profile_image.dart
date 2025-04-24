import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import '../../../common_widgets/expandable_icon_button.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/random_images/huston.jpg'),
            radius: 100.0,
          ),
        ),
        gbHt10,
        const BioDetails(),
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

class BioDetails extends StatelessWidget {
  const BioDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Samuel Huston',
          softWrap: true,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        gbHt5,
        Text(
          'Creating a user profile page in Flutter involves several key concepts, including the use of widgets to structure the layout',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
