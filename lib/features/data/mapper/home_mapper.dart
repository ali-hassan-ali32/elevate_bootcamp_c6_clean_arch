import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/banners_response.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/products_response.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_entity.dart';
import '../models/categories_response.dart';

@lazySingleton
class HomeMapper {
  List<BannerEntity> mapBannersResponseToBannersEntityList(
    List<BannerResponse> banners,
  ) {
    return banners
        .map((banner) => mapBannerResponseToBannerEntity(banner))
        .toList();
  }

  BannerEntity mapBannerResponseToBannerEntity(BannerResponse banner) {
    return BannerEntity(
      title: banner.title ?? 'No Title',
      image: banner.image ?? '',
      alignment: mapAlignment(banner.alignment ?? ''),
    );
  }

  Alignment mapAlignment(String aliment) {
    return switch (aliment) {
      'start' => Alignment.bottomCenter,
      'end' => Alignment.bottomLeft,
      _ => Alignment.center,
    };
  }

  List<ProductEntity> mapProductsResponseListToProductEntityList(
    List<ProductResponse> products,
  ) {
    return products
        .map((product) => mapProductResponseToProductEntity(product))
        .toList();
  }

  ProductEntity mapProductResponseToProductEntity(ProductResponse product) {
    return ProductEntity(
      title: product.title ?? 'No Title',
      images: product.images ?? [],
      slug: product.slug ?? '',
      ratingsQuantity: product.ratingsQuantity ?? 0,
    );
  }

  List<CategoryEntity> mapCategoryResponseListToCategoryEntityList(
    List<CategoryResponse> categories,
  ) {
    return categories
        .map(
          (category) => CategoryEntity(
            id: category.id ?? '',
            name: category.name ?? '',
            image: category.image ?? '',
          ),
        )
        .toList();
  }
}
