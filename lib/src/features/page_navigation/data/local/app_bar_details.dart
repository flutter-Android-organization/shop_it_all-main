import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/custom_app_bar.dart';

class AppBarDetails {
  static List<PreferredSizeWidget> appBarData = [
    CustomAppBar(
      customText: 'Samuel Huston',
      customSubText: 'Online',
      customImage: 'assets/images/random_images/huston.jpg',
    ),
    CustomAppBar(
        customText: 'Wishlist',
        customTextAlt: 'Wishlist',
        customSubText: 'Shop for all your wishes',
        customImage: 'assets/images/random_images/wishList.png',
      customImageAlt: 'assets/images/random_images/wishList.png',
    ),
    CustomAppBar(
      customText: 'Profile',
      customTextAlt: 'Profile',
      customSubText: '',
      customImage: 'assets/images/random_images/profile.png',
      customImageAlt: 'assets/images/random_images/profile.png',
      customIconChange: false,
    ),
    CustomAppBar(
      customText: 'Product Cart',
      customTextAlt: 'Product Cart',
      customSubText: '',
      customImage: 'assets/images/random_images/cart.png',
      customImageAlt: 'assets/images/random_images/cart.png',
      customIconChange: false,
    ),
  ];
}
