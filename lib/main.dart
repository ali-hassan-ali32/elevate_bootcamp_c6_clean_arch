import 'package:elevate_bootcamp_c6_clean_arch/config/providers/app_config_provider.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/presentaions/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt<AppConfigProvider>().setThemeMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt<AppConfigProvider>(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',

            debugShowCheckedModeBanner: false,
            theme: context.watch<AppConfigProvider>().theme,
            home: HomeView(),
          );
        }
      )
    );
  }
}