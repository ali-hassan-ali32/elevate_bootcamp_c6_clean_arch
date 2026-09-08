import 'package:dio/dio.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/categories_response.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/api_constants.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {

  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(ApiConstants.productsByCategory)
  Future<ProductsResponse> getProducts(@Query(ApiConstants.qCategoryId) String categoryId);

  @GET(ApiConstants.categories)
  Future<CategoriesResponse> getCategories();
}