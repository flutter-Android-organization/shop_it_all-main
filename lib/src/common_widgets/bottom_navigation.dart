import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.currentIndex, required this.onItemTap});

  final int currentIndex;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50)
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onItemTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: btnColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          items: const [
            BottomNavigationBarItem(
                key: ShopItKeys.homeBtnKey,
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                key: ShopItKeys.wishBtnKey,
                icon: Icon(Icons.favorite_border),
                label: 'Favourite'),
            BottomNavigationBarItem(
                key: ShopItKeys.profileBtnKey,
                icon: Icon(Icons.person_outline_rounded),
                label: 'Profile'),
            BottomNavigationBarItem(
                key: ShopItKeys.cartBtnKey,
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart'),
          ],
        ),
      ),
    );
  }
}

