import 'dart:ui';

class CategoryModel {
  CategoryModel(this.categoryText, this.categoryImage);

  final String categoryText;
  final String categoryImage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          categoryText == other.categoryText &&
          categoryImage == other.categoryImage;

  @override
  int get hashCode => categoryText.hashCode ^ categoryImage.hashCode;

  @override
  String toString() {
    return 'CategoryModel{categoryText: $categoryText, categoryImage: $categoryImage}';
  }


}