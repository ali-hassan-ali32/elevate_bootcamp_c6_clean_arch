import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/product_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByIdUseCase {
  final HomeRepo _homeRepo;
  GetProductsByIdUseCase(this._homeRepo);

  Future<AppResults<List<ProductEntity>>> call(String categoryId)
    => _homeRepo.getProducts(categoryId);
}