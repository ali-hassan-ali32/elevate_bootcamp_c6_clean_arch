import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<AppResults<List<BannerEntity>>> getBanners();
  Future<AppResults<List<ProductEntity>>> getProducts(String categoryId);
  Future<AppResults<List<CategoryEntity>>> getCategories();
}