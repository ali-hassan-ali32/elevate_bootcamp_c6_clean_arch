import 'package:elevate_bootcamp_c6_clean_arch/config/di/di.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/errors/app_error.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/network/app_results.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/entities/bunner_entity.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/repo/home_repo.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/domain/use_cases/get_banners_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_banners_use_case_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late MockHomeRepo mockHomeRepo;
  late GetBannersUseCase getBannersUseCase;

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    getBannersUseCase = GetBannersUseCase(mockHomeRepo);
  });

  group('Test Get Banner Use Case', () {
    test('should return Success when repository returns Success', () async {
      // Arrange
      final success = Success<List<BannerEntity>>([]);
      provideDummy<AppResults<List<BannerEntity>>>(success);
      when(mockHomeRepo.getBanners()).thenAnswer((_) async => success);
      // Act
      var response = await getBannersUseCase.call();
      // Assert
      expect(response, same(success));
      verify(mockHomeRepo.getBanners()).called(1);
    });

    test('should return Failure when repository returns Failure', () async {
      // Arrange
      final failure = Failure<List<BannerEntity>>('', IgnoreAppError());
      provideDummy<AppResults<List<BannerEntity>>>(failure);
      when(mockHomeRepo.getBanners()).thenAnswer((_) async => failure);
      // Act
      final response = await getBannersUseCase.call();
      // Assert
      expect(response, same(failure));
      verify(mockHomeRepo.getBanners()).called(1);
    });
  });
}
