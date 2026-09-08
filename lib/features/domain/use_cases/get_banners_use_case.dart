import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBannersUseCase {
  final HomeRepo _homeRepo;

  const GetBannersUseCase(this._homeRepo);

  Future<AppResults<List<BannerEntity>>> call() async {
    return await _homeRepo.getBanners();
  }
}
