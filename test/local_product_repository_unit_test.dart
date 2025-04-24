import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shop_it_all/src/datasource/product_data_source.dart';
import 'package:shop_it_all/src/features/home/data/repository/local/local_product_repository.dart';

class MockLocalProductRepository extends Mock
    implements LocalProductRepository {}

void main() {
  group('Using a Mocktail for testing', () {
    final mockLocalProductRepository = MockLocalProductRepository();

    test('Checking the total number of product with mocktail', () {
      when(() => mockLocalProductRepository.totalProducts()).thenAnswer((_) => ProductDataSource.productList.length);
      verify(mockLocalProductRepository.totalProducts).called(1);
      expect(mockLocalProductRepository.totalProducts(),
          ProductDataSource.productList.length);
    });
  });

  group('Testing without MockTail', () {
    test('Checking the total number of product', () {
      final fakeLocalProductRepository = LocalProductRepository();
      expect(fakeLocalProductRepository.totalProducts(),
          ProductDataSource.productList.length);
    });

    test('Checking if the Product list are returned', () async {
      final fakeLocalProductRepository = LocalProductRepository();
      final products =
          await fakeLocalProductRepository.fetchProducts(); // Await the future
      expect(products, ProductDataSource.productList);
    });

    test('Checking if stream emits product list', () async {
      final fakeLocalProductRepository = LocalProductRepository();
      final products = fakeLocalProductRepository.watchProductsList();
      expect(products, emits(ProductDataSource.productList));
    });

    test('Checking if get product returns the requested product by id', () {
      final fakeLocalProductRepository = LocalProductRepository();
      final products = fakeLocalProductRepository.watchProduct('1');
      expect(products, emits(ProductDataSource.productList[0]));
    });

    test('Checking if getProduct(100)  returns null', () {
      final fakeLocalProductRepository = LocalProductRepository();
      expect(fakeLocalProductRepository.getProduct('100'), isNull);
    });

    test('Checking if watchList(100)  returns null', () {
      final fakeLocalProductRepository = LocalProductRepository();
      expect(fakeLocalProductRepository.watchProduct('100'), emits(isNull));
    });
  });
}
