import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../datasource/product_data_source.dart';
import '../../../home/domain/product_model.dart';
part 'search_repository.g.dart';

class SearchRepository {
  Future<List<ProductModel>> getAllProducts() async {
    return ProductDataSource.productList;
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    if (query.isEmpty) return getAllProducts();

    final allProducts = await getAllProducts();
    return allProducts.where((product) {
      final nameLower = product.productName.toLowerCase();
      final descLower = product.productDescription.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower) ||
          descLower.contains(queryLower);
    }).toList();
  }
}

@riverpod
SearchRepository searchRepository(ref) {
  return SearchRepository();
}