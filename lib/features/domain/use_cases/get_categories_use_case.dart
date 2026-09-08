import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/category_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepo _homeRepo;
  GetCategoriesUseCase(this._homeRepo);

  Future<AppResults<List<CategoryEntity>>> call() => _homeRepo.getCategories();
}
