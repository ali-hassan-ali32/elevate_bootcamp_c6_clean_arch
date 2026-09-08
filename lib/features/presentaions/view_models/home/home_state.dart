import 'package:elevate_bootcamp_c6_clean_arch/core/base/resources.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';

class HomeState {
  final Resources<List<ProductEntity>> productResources;
  final Resources<List<CategoryEntity>> categoryResources;
  final Resources<List<BannerEntity>> bannerResources;

  HomeState({
    required this.productResources,
    required this.bannerResources,
    required this.categoryResources,
  });

  HomeState copyWith({
    Resources<List<ProductEntity>>? productResources,
    Resources<List<CategoryEntity>>? categoryResources,
    Resources<List<BannerEntity>>? bannerResources,
  }) {
    return HomeState(
      productResources: productResources ?? this.productResources,
      bannerResources: bannerResources ?? this.bannerResources,
      categoryResources: categoryResources ?? this.categoryResources,
    );
  }
}
