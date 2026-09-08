import 'package:elevate_bootcamp_c6_clean_arch/config/di/di.dart';
import 'package:elevate_bootcamp_c6_clean_arch/config/providers/app_config_provider.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/base/resources.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/presentaions/view_models/home/home_cubit.dart';
import 'package:elevate_bootcamp_c6_clean_arch/features/presentaions/view_models/home/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_models/home/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeCubit cubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    debugPrint('OOOO The Home Page has Reborn OOOO');
    cubit.doEvent(
      GetHomeDataEvent(
        GetProductsByCategoryIdEvent('6439d5b90049ad0b52b90048'),
      ),
    );
    cubit.uiStream.listen((event) {
      switch (event) {
        case ShowMessageEvent():
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(title: Text(event.message));
            },
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                switch (state.categoryResources.status) {
                  Status.init => Placeholder(),
                  Status.loading => CircularProgressIndicator(),
                  Status.failure => Text(state.categoryResources.message ?? ''),
                  Status.success => Center(
                    child: Text(state.categoryResources.data![1].name),
                  ),
                  Status.empty => Center(child: Text('Empty Categories')),
                },

                switch (state.bannerResources.status) {
                  Status.init => Placeholder(),
                  Status.loading => CircularProgressIndicator(),
                  Status.failure => Text(state.bannerResources.message ?? ''),
                  Status.success => Center(
                    child: Text(state.bannerResources.data![0].title),
                  ),
                  Status.empty => Center(child: Text('Empty Banners')),
                },

                switch (state.productResources.status) {
                  Status.init => Placeholder(),
                  Status.loading => CircularProgressIndicator(),
                  Status.failure => Text(state.productResources.message ?? ''),
                  Status.success => Center(
                    child: Text(state.productResources.data![0].title),
                  ),
                  Status.empty => Center(child: Text('Empty Products')),
                },

                ElevatedButton(
                  onPressed: () async {
                    final provider = getIt<AppConfigProvider>();

                    await provider.changeThemeMode(
                      provider.getCurrentTheme() == ThemeOption.customer
                          ? ThemeOption.handyman
                          : ThemeOption.customer,
                    );

                    debugPrint('XXXXXX ${provider.getCurrentTheme()} XXXXXX');
                  },
                  child: Text('Change Theme'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
