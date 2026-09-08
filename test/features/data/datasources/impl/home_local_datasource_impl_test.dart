import 'package:elevate_bootcamp_c6_clean_arch/config/di/di.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/base/decoder.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/datasources/contract/home_local_datasource.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/data/datasources/impl/home_local_datasource_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_local_datasource_impl_test.mocks.dart';

@GenerateMocks([AssetBundle, Decoder])
void main() {
  late HomeLocalDatasource homeLocalDatasource;
  late MockAssetBundle assetBundle;
  late MockDecoder decoder;

  setUpAll(() {
    assetBundle = MockAssetBundle();
    decoder = MockDecoder();
    getIt.registerFactory<Decoder>(() => decoder);
    getIt.registerFactory<AssetBundle>(() => assetBundle);
    getIt.registerFactory<HomeLocalDatasource>(
      () => HomeLocalDatasourceImpl(getIt<AssetBundle>(), getIt<Decoder>()),
    );
    homeLocalDatasource = getIt<HomeLocalDatasource>();
  });

  group('Test Load Banners Function', () {
    test('Calling Read Banners With Failure Response', () async {
      try {
        when(assetBundle.loadString(any)).thenAnswer((_) async => '{}');
        when(decoder.decode(any)).thenAnswer((_) => {});
        var response = await homeLocalDatasource.getBanners();
        expect(response.banners, isNull);
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });

    test('Calling Read Banners With Success Response', () async {
      Map<String, dynamic> data = {
        "banners": [
          {
            "image": "assets/images/advertisement_1.png",
            "title": "Up To \n25% Off",
            "categoryName": "For all Headphones \n& AirPods",
            "alignment": "end",
            "buttonBackGroundColor": 4278206850,
            "buttonForGroundColor": 4294967295,
          },
        ],
      };
      when(assetBundle.loadString(any)).thenAnswer((_) async => '');
      when(decoder.decode(any)).thenAnswer((realInvocation) => data);
      var response = await homeLocalDatasource.getBanners();
      expect(response.banners, isNotEmpty);
      expect(response.banners?.length, equals(1));
    });
  });
}
