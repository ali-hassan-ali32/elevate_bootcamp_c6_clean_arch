import 'package:elevate_bootcamp_c6_clean_arch/core/base/decoder.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/datasources/contract/home_local_datasource.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/banners_response.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLocalDatasource)
class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  final AssetBundle _assetBundle;
  final Decoder _decoder;
  HomeLocalDatasourceImpl(this._assetBundle, this._decoder);

  @override
  Future<BannersResponse> getBanners() async {
    var response = await _assetBundle.loadString('assets/files/banners.json');
    return BannersResponse.fromJson(_decoder.decode(response));
  }
}
