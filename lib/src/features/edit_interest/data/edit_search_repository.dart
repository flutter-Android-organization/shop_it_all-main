import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../datasource/Category_data_source.dart';
import '../../home/domain/category_model.dart';
part 'edit_search_repository.g.dart';


class EditSearchRepository {
  Future<List<CategoryModel>> getAllProducts() async {
    return CategoryDataSource.categoryList;
  }

  Future<List<CategoryModel>> searchProducts(String query) async {
    if (query.isEmpty) return getAllProducts();

    final allProducts = await getAllProducts();
    return allProducts.where((product) {
      final nameLower = product.categoryText.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();
  }
}

@riverpod
EditSearchRepository editSearchRepository(ref) {
  return EditSearchRepository();
}