import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/star_rating_bar.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: pd1All0,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReviewTop(
            reviewImage: 'assets/images/random_images/profile.png',
            reviewUsrName: 'Emma Weston',
            reviewDate: '1st June 2000',
          ),
          gbHt10,
          ReviewBottom(
              reviewText:
                  'This example demonstrates how to create an interactive '
                  'IconButton in Flutter that toggles between two icons when tapped.'
                  ' You can customize this further by adding animations or additional '
                  'functionalities as needed for your application'
          )
        ],
      ),
    );
  }
}

class ReviewTop extends StatelessWidget {
  const ReviewTop(
      {super.key,
      required this.reviewImage,
      required this.reviewUsrName,
      required this.reviewDate});

  final String reviewImage;
  final String reviewUsrName;
  final String reviewDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(reviewImage),
            ),
            gbWd10,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewUsrName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.0),
                ),
                gbHt5,
                const StarRatingBar()
              ],
            ),
          ],
        ),
        Text(
          reviewDate,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}

class ReviewBottom extends StatelessWidget {
  const ReviewBottom({super.key, required this.reviewText});

  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Comment',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
        Text(
          reviewText,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}
