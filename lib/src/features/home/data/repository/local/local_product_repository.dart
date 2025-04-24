import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/datasource/product_data_source.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
part 'local_product_repository.g.dart';

class LocalProductRepository{

  final _products = ProductDataSource.productList;

  Future<List<ProductModel>> fetchProducts () async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(_products);
  }

  static ProductModel? _getProduct(List<ProductModel> products, String id) {
    try {
      return products.firstWhere((product) => product.productId == id);
    } catch (e) {
      return null;
    }
  }

  Stream<List<ProductModel>> watchProductsList() async*{
    yield _products;
  }

  Stream<ProductModel?> watchProduct(String id) {
    return watchProductsList().map((products) => _getProduct(products, id));
  }

  ProductModel? getProduct(String id) {
    return _getProduct(_products, id) ;
  }
  int totalProducts () => _products.length;
}

@riverpod
LocalProductRepository localProductRepository(ref) {
  return LocalProductRepository();
}

@riverpod
Future<List<ProductModel>> fetchProduct(ref) {
  final productRepository = ref.watch(localProductRepositoryProvider);
  return productRepository.fetchProducts();
}

@riverpod
int totalProduct(ref) {
  final productRepository = ref.watch(localProductRepositoryProvider);
  return productRepository.totalProducts();
}

final watchProductListProvider = StreamProvider((Ref ref) {
  final localProductRepository = ref.watch(localProductRepositoryProvider);
  return localProductRepository.watchProductsList();
});

final watchProductProvider = StreamProvider.family<ProductModel?, String>((Ref ref, String id) {
  final localProductRepository = ref.watch(localProductRepositoryProvider);
  return localProductRepository.watchProduct(id);
});



