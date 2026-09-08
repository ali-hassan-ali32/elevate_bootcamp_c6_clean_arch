import 'package:elevate_bootcamp_c6_clean_arch/core/base/resources.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/errors/app_error.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_banners_use_case.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_categories_use_case.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_products_by_id_use_case.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/presentaions/view_models/home/home_cubit.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/presentaions/view_models/home/home_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([
  GetProductsByIdUseCase,
  GetCategoriesUseCase,
  GetBannersUseCase,
])
void main() {
  late MockGetProductsByIdUseCase getProductsByIdUseCase;
  late MockGetCategoriesUseCase getCategoriesUseCase;
  late MockGetBannersUseCase getBannersUseCase;
  late HomeCubit homeCubit;

  setUpAll(() {
    provideDummy<AppResults<List<ProductEntity>>>(
      Success<List<ProductEntity>>([]),
    );
    provideDummy<AppResults<List<BannerEntity>>>(
      Success<List<BannerEntity>>([]),
    );
    provideDummy<AppResults<List<CategoryEntity>>>(
      Success<List<CategoryEntity>>([]),
    );
  });

  // 🎯 2. تجهيز كائنات جديدة لكل Test لمنع تداخل النتائج
  setUp(() {
    getProductsByIdUseCase = MockGetProductsByIdUseCase();
    getCategoriesUseCase = MockGetCategoriesUseCase();
    getBannersUseCase = MockGetBannersUseCase();

    // 💡 بنباصي الـ Mocks مباشرة للـ Cubit بدون الحاجة لـ GetIt
    homeCubit = HomeCubit(
      getProductsByIdUseCase,
      getCategoriesUseCase,
      getBannersUseCase,
    );

    // Default Stubs أساسية لمنع الـ MissingDummyValueError أثناء تنفيذ doEvent
    when(getProductsByIdUseCase.call(any))
        .thenAnswer((_) async => Success<List<ProductEntity>>([]));
    when(getCategoriesUseCase.call())
        .thenAnswer((_) async => Success<List<CategoryEntity>>([]));
    when(getBannersUseCase.call())
        .thenAnswer((_) async => Success<List<BannerEntity>>([]));
  });

  tearDown(() {
    homeCubit.close();
  });

  group('Test Load Home Data Functionality', () {

    // -------------------------------------------------------------------------
    // 🖼️ 1. TEST BANNERS
    // -------------------------------------------------------------------------
    group('Test Get Banners Function', () {
      test('Test Get Banners Success', () async {
        // Arrange
        expect(homeCubit.state.bannerResources.status, equals(Status.init));
        when(getBannersUseCase.call())
            .thenAnswer((_) async => Success<List<BannerEntity>>([]));

        // Act
        await homeCubit.doEvent(GetHomeDataEvent(GetProductsByCategoryIdEvent('')));

        // Assert
        expect(homeCubit.state.bannerResources.status, equals(Status.success));
        verify(getBannersUseCase.call()).called(1);
      });

      test('Test Get Banners Failure', () async {
        // Arrange
        when(getBannersUseCase.call())
            .thenAnswer((_) async => Failure<List<BannerEntity>>('Server Error',IgnoreAppError()));

        // Act
        await homeCubit.doEvent(GetHomeDataEvent(GetProductsByCategoryIdEvent('')));

        // Assert
        expect(homeCubit.state.bannerResources.status, equals(Status.failure));
      });
    });

    // -------------------------------------------------------------------------
    // 📂 2. TEST CATEGORIES
    // -------------------------------------------------------------------------
    group('Test Get Categories Function', () {
      test('Test Get Categories Success', () async {
        // Arrange
        expect(homeCubit.state.categoryResources.status, equals(Status.init));
        when(getCategoriesUseCase.call())
            .thenAnswer((_) async => Success<List<CategoryEntity>>([]));

        // Act
        await homeCubit.doEvent(GetHomeDataEvent(GetProductsByCategoryIdEvent('')));

        // Assert
        expect(homeCubit.state.categoryResources.status, equals(Status.success));
        verify(getCategoriesUseCase.call()).called(1);
      });

      test('Test Get Categories Failure', () async {
        // Arrange
        when(getCategoriesUseCase.call()).thenAnswer((_) async => Failure<List<CategoryEntity>>('Network Error',IgnoreAppError()));

        // Act
        await homeCubit.doEvent(GetHomeDataEvent(GetProductsByCategoryIdEvent('')));

        // Assert
        expect(homeCubit.state.categoryResources.status, equals(Status.failure));
      });
    });

    // -------------------------------------------------------------------------
    // 🛍️ 3. TEST PRODUCTS
    // -------------------------------------------------------------------------
    group('Test Get Products Function', () {
      test('Test Get Products Success', () async {
        // Arrange
        expect(homeCubit.state.productResources.status, equals(Status.init));
        when(getProductsByIdUseCase.call(any))
            .thenAnswer((_) async => Success<List<ProductEntity>>([]));

        // Act
        await homeCubit.doEvent(GetHomeDataEvent(GetProductsByCategoryIdEvent('')));

        // Assert
        expect(homeCubit.state.productResources.status, equals(Status.success));
        verify(getProductsByIdUseCase.call(any)).called(1);
      });

      test('Test Get Products Failure', () async {
        // Arrange
        when(getProductsByIdUseCase.call(any))
            .thenAnswer((_) async => Failure<List<ProductEntity>>('Not Found', IgnoreAppError()));

        // Act
        await homeCubit.doEvent(GetHomeDataEvent(GetProductsByCategoryIdEvent('')));

        // Assert
        expect(homeCubit.state.productResources.status, equals(Status.failure));
      });
    });

  });
}