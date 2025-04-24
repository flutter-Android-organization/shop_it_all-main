import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';

class SingleItemContainer extends StatelessWidget {
  const SingleItemContainer(
      {super.key,
      required this.onContainerClick,
      required this.height,
      required this.containText,
      required this.assetName});

  final VoidCallback onContainerClick;
  final double height;
  final String containText;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.blue,
      onTap: onContainerClick,
      onHover: null,

      /// TODO: Implement a hover effect
      child: Card.outlined(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: pd1All0,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetName), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              containText,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 6.0)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
