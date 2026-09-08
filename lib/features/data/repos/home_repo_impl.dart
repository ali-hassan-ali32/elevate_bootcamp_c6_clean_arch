import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/safe_call.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/api/home_api_client.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/datasources/contract/home_local_datasource.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/mapper/home_mapper.dart';

import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';

import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';

import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{
  
  final HomeLocalDatasource _localDatasource;
  final HomeApiClient _homeApiClient;
  final HomeMapper _homeMapper;
  
  HomeRepoImpl(
      this._homeMapper,
      this._homeApiClient,
      this._localDatasource
      );

  @override
  Future<AppResults<List<BannerEntity>>> getBanners() {
    return safeCall(() async {
      var response = await _localDatasource.getBanners();
      return Success(
          _homeMapper.mapBannersResponseToBannersEntityList(response.banners ?? [])
      );
    },);
  }

  @override
  Future<AppResults<List<CategoryEntity>>> getCategories() {
    return safeCall(() async {
      var response = await _homeApiClient.getCategories();
      return Success(
        _homeMapper.mapCategoryResponseListToCategoryEntityList(response.data ?? [])
      );
    },);
  }

  @override
  Future<AppResults<List<ProductEntity>>> getProducts(String categoryId) {
    return safeCall(() async {
      var response = await _homeApiClient.getProducts(categoryId);
      return Success(
        _homeMapper.mapProductsResponseListToProductEntityList(response.data ?? [])
      );
    },);
  }
}