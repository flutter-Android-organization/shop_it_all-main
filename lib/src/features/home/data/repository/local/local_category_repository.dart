import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/datasource/Category_data_source.dart';
import 'package:shop_it_all/src/features/home/domain/category_model.dart';
part 'local_category_repository.g.dart';

class LocalCategoryRepository {
  final List<CategoryModel> categories = CategoryDataSource.categoryList;

  Future<List<CategoryModel>> fetchCategory() async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(categories);
  }
}

@riverpod
LocalCategoryRepository localCategoryRepository(ref) {
  return LocalCategoryRepository();
}

@riverpod
Future<List<CategoryModel>> fetchCategories(ref) async {
  final categoryRepository = ref.watch(localCategoryRepositoryProvider);
  return await categoryRepository.fetchCategory();
}


