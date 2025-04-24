

import 'package:flutter/material.dart';
import 'package:shop_it_all/src/features/home/domain/category_model.dart';

class CategoryDataSource {
  static List<CategoryModel> categoryList = [
    CategoryModel('FASHION', 'assets/images/category_images/fashion.jpg'),
    CategoryModel('GAMING', 'assets/images/category_images/gaming.jpg'),
    CategoryModel('TECH', 'assets/images/category_images/technology.jpg'),
    CategoryModel('HOUSE', 'assets/images/category_images/realState.jpg'),
    CategoryModel('VEHICLE', 'assets/images/category_images/vehicle.jpg'),
    CategoryModel('MEDICAL', 'assets/images/category_images/medical.jpg'),
    CategoryModel('FOOD', 'assets/images/category_images/food.jpg'),
    CategoryModel('ANIMAL', 'assets/images/category_images/animals.jpg'),
    CategoryModel('STATIONERY', 'assets/images/category_images/stationary.jpg'),
    CategoryModel('UTENSIL', 'assets/images/category_images/utensils.jpg'),

  ];
}