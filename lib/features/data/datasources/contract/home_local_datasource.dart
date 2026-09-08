import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/banners_response.dart';

abstract class HomeLocalDatasource {
  Future<BannersResponse> getBanners();
}