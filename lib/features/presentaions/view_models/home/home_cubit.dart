import 'dart:async';

import 'package:elevate_bootcamp_c6_clean_arch/core/base/resources.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_banners_use_case.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_categories_use_case.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_products_by_id_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.productsByIdUseCase,
    this.getCategoriesUseCase,
    this.getBannersUseCase,
  ) : super(
        HomeState(
          productResources: Resources.init(),
          categoryResources: Resources.init(),
          bannerResources: Resources.init(),
        ),
      );

  final GetProductsByIdUseCase productsByIdUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetBannersUseCase getBannersUseCase;

  final StreamController<HomeUiEvent> _uiController =
      StreamController.broadcast();
  Stream<HomeUiEvent> get uiStream => _uiController.stream;

  Future<void> doEvent(HomeEvent event) async {
    switch (event) {
      case GetProductsByCategoryIdEvent():
        await _getProductsByCategoryId(event);
      case GetCategoriesEvent():
        await _getCategories(event);
      case GetBannersEvent():
        await _getBanners(event);
      case GetHomeDataEvent():
        {
          Future.wait([
            _getProductsByCategoryId(event.productEvent),
            _getCategories(GetCategoriesEvent()),
            _getBanners(GetBannersEvent()),
          ]);
        }
    }
  }

  Future<void> _getProductsByCategoryId(
    GetProductsByCategoryIdEvent event,
  ) async {
    emit(state.copyWith(productResources: Resources.loading()));

    var response = await productsByIdUseCase.call(event.categoryId);

    switch (response) {
      case Success<List<ProductEntity>>():
        emit(
          state.copyWith(productResources: Resources.success(response.data)),
        );
      case Failure<List<ProductEntity>>():
        _uiController.add(ShowMessageEvent(response.appError?.message ?? ''));

        emit(
          state.copyWith(
            productResources: Resources.failure(
              response.appError?.message ?? 'Something Went Wrong',
            ),
          ),
        );
    }
  }

  Future<void> _getCategories(GetCategoriesEvent event) async {
    emit(state.copyWith(categoryResources: Resources.loading()));

    var response = await getCategoriesUseCase.call();

    switch (response) {
      case Success<List<CategoryEntity>>():
        emit(
          state.copyWith(categoryResources: Resources.success(response.data)),
        );

      case Failure<List<CategoryEntity>>():
        emit(
          state.copyWith(
            categoryResources: Resources.failure(
              response.appError?.message ?? 'Something Went Wrong',
            ),
          ),
        );
    }
  }

  Future<void> _getBanners(GetBannersEvent event) async {
    emit(state.copyWith(bannerResources: Resources.loading()));

    var response = await getBannersUseCase.call();

    switch (response) {
      case Success<List<BannerEntity>>():
        {
          emit(
            state.copyWith(bannerResources: Resources.success(response.data)),
          );
        }
      case Failure<List<BannerEntity>>():
        emit(
          state.copyWith(
            bannerResources: Resources.failure(
              response.appError?.message ?? 'Something Went Wrong',
            ),
          ),
        );
    }
  }
}
