import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/page_navigation/data/local/page_details.dart';
part 'navigation_repository.g.dart';

class NavigationRepository {

  List<Widget> pages () => PageDetails.pageData;
}

@riverpod
NavigationRepository navigationRepository (ref) {
  return NavigationRepository();
}