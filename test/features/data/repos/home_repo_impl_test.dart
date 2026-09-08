import 'package:elevate_bootcamp_c6_clean_arch/config/di/di.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/api/home_api_client.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/datasources/contract/home_local_datasource.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/mapper/home_mapper.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/banners_response.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/categories_response.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/repos/home_repo_impl.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/repo/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeLocalDatasource, HomeApiClient, HomeMapper])
void main() {
  late MockHomeLocalDatasource homeLocalDatasource;
  late MockHomeApiClient homeApiClient;
  late MockHomeMapper homeMapper;
  late HomeRepo homeRepo;

  setUpAll(() {
    homeLocalDatasource = MockHomeLocalDatasource();
    homeApiClient = MockHomeApiClient();
    homeMapper = MockHomeMapper();
    getIt.registerFactory<HomeApiClient>(() => homeApiClient);
    getIt.registerFactory<HomeLocalDatasource>(() => homeLocalDatasource);
    getIt.registerFactory<HomeMapper>(() => homeMapper);
    getIt.registerFactory<HomeRepo>(() => HomeRepoImpl(getIt(), getIt(), getIt()),);
    homeRepo = getIt();
  });
  
  
  group('Test Get Banners Function', () {
    test('Verify Call Function Correctly', () {
      when(homeLocalDatasource.getBanners()).thenAnswer((_) async => BannersResponse());
      when(homeMapper.mapBannersResponseToBannersEntityList(any)).thenAnswer((_) => <BannerEntity>[]);
      homeRepo.getBanners();
      verify(homeLocalDatasource.getBanners());
    },);

    test('Test Get Banners return Success', () async {
      when(homeLocalDatasource.getBanners()).thenAnswer((_) async => BannersResponse());
      when(homeMapper.mapBannersResponseToBannersEntityList(any)).thenAnswer((_) => <BannerEntity>[]);
      var response = await homeRepo.getBanners();
      verify(homeLocalDatasource.getBanners());
      expect(response, isA<Success<List<BannerEntity>>>());
    },);

    test('Test Get Banners return The Correct List', () async {
      var responseList = List.filled(3,
          BannerEntity(
              title: '',
              image: '',
              alignment: Alignment.bottomLeft
          )
      );
      when(homeLocalDatasource.getBanners()).thenAnswer((_) async => BannersResponse());
      when(homeMapper.mapBannersResponseToBannersEntityList(any)).thenAnswer((_) => responseList);
      var response = await homeRepo.getBanners();
      verify(homeLocalDatasource.getBanners());
      expect(response.data, equals(responseList));
    },);
  });

  group('Test Get Categories Function', () {
    test('Verify Call Function Correctly', () {
      when(homeApiClient.getCategories()).thenAnswer((_) async => CategoriesResponse());
      when(homeMapper.mapCategoryResponseListToCategoryEntityList(any)).thenAnswer((_) => <CategoryEntity>[]);
      homeRepo.getCategories();
      verify(homeApiClient.getCategories());
    },);

    test('Test Get Categories return Success', () async {
      when(homeApiClient.getCategories()).thenAnswer((_) async => CategoriesResponse());
      when(homeMapper.mapCategoryResponseListToCategoryEntityList(any)).thenAnswer((_) => <CategoryEntity>[]);
      var response = await homeRepo.getCategories();
      expect(response, isA<Success<List<CategoryEntity>>>());
    },);

    test('Test Get Banners return The Correct List', () async {
      var responseList = List.filled(3,
          BannerEntity(
              title: '',
              image: '',
              alignment: Alignment.bottomLeft
          )
      );
      when(homeLocalDatasource.getBanners()).thenAnswer((_) async => BannersResponse());
      when(homeMapper.mapBannersResponseToBannersEntityList(any)).thenAnswer((_) => responseList);
      var response = await homeRepo.getBanners();
      verify(homeLocalDatasource.getBanners());
      expect(response.data, equals(responseList));
    },);
  });
  
  group('Test Get Products Function', () {});
  
}