// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/services.dart' as _i281;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/base/decoder.dart' as _i1050;
import '../../core/network/auth_interceptor.dart' as _i388;
import '../../core/storage/secure_storage_service.dart' as _i64;
import '../../features/data/api/home_api_client.dart' as _i561;
import '../../features/data/datasources/contract/home_local_datasource.dart'
    as _i85;
import '../../features/data/datasources/impl/home_local_datasource_impl.dart'
    as _i178;
import '../../features/data/mapper/home_mapper.dart' as _i48;
import '../../features/data/repos/home_repo_impl.dart' as _i651;
import '../../features/domain/repo/home_repo.dart' as _i705;
import '../../features/domain/use_cases/get_banners_use_case.dart' as _i469;
import '../../features/domain/use_cases/get_categories_use_case.dart' as _i201;
import '../../features/domain/use_cases/get_products_by_id_use_case.dart'
    as _i261;
import '../../features/presentaions/view_models/home/home_cubit.dart' as _i158;
import '../providers/app_config_provider.dart' as _i56;
import 'modules/asset_bundle_module.dart' as _i574;
import 'modules/network_module.dart' as _i851;
import 'modules/secure_storage_module.dart' as _i590;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final assetBundleModule = _$AssetBundleModule();
    final networkModule = _$NetworkModule();
    final secureStorageModule = _$SecureStorageModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i1050.Decoder>(() => _i1050.Decoder());
    gh.lazySingleton<_i281.AssetBundle>(
      () => assetBundleModule.provideAssetBundle(),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.lazySingleton<_i48.HomeMapper>(() => _i48.HomeMapper());
    gh.factory<_i561.HomeApiClient>(() => _i561.HomeApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i64.SecureStorageService>(
      () => _i64.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i56.AppConfigProvider>(
      () => _i56.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i85.HomeLocalDatasource>(
      () => _i178.HomeLocalDatasourceImpl(
        gh<_i281.AssetBundle>(),
        gh<_i1050.Decoder>(),
      ),
    );
    gh.lazySingleton<_i388.AuthInterceptor>(
      () => _i388.AuthInterceptor(gh<_i64.SecureStorageService>()),
    );
    gh.factory<_i705.HomeRepo>(
      () => _i651.HomeRepoImpl(
        gh<_i48.HomeMapper>(),
        gh<_i561.HomeApiClient>(),
        gh<_i85.HomeLocalDatasource>(),
      ),
    );
    gh.factory<_i469.GetBannersUseCase>(
      () => _i469.GetBannersUseCase(gh<_i705.HomeRepo>()),
    );
    gh.factory<_i201.GetCategoriesUseCase>(
      () => _i201.GetCategoriesUseCase(gh<_i705.HomeRepo>()),
    );
    gh.factory<_i261.GetProductsByIdUseCase>(
      () => _i261.GetProductsByIdUseCase(gh<_i705.HomeRepo>()),
    );
    gh.factory<_i158.HomeCubit>(
      () => _i158.HomeCubit(
        gh<_i261.GetProductsByIdUseCase>(),
        gh<_i201.GetCategoriesUseCase>(),
        gh<_i469.GetBannersUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$AssetBundleModule extends _i574.AssetBundleModule {}

class _$NetworkModule extends _i851.NetworkModule {}

class _$SecureStorageModule extends _i590.SecureStorageModule {}
