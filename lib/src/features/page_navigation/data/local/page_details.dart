import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/cart/presentation/cart_page.dart';
import 'package:shop_it_all/src/features/home/presentation/home_page.dart';
import 'package:shop_it_all/src/features/wishlist/presentation/wish_list_page.dart';

import '../../../profile/presentation/profile_page.dart';

class PageDetails {
  static List<Widget> pageData = [
    const HomePage(),
    const WishListPage(),
    const ProfilePage(),
    const CartPage()
  ];
}
