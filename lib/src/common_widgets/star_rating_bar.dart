import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatingBar extends StatefulWidget {
  const StarRatingBar({super.key});

  @override
  State<StarRatingBar> createState() => _StarRatingBarState();
}

class _StarRatingBarState extends State<StarRatingBar> {
  double _rating = 3;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: _rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 20.0,
      itemCount: 5,
      unratedColor: Colors.grey,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rate_outlined,
        color: Colors.blue,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating; // Update the state with the new rating
        });
      },
    );
  }
}

