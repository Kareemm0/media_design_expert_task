import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:media_design_expert_task/Features/home/data/datasource/base/items_data_source.dart';
import 'package:media_design_expert_task/Features/home/data/datasource/impl/items_data_source_impl.dart';
import 'package:media_design_expert_task/Features/home/data/repos/item_repo_impl.dart';
import 'package:media_design_expert_task/Features/home/domain/item_repo.dart';
import 'package:media_design_expert_task/Features/home/presentation/cubit/cubit/item_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/end_points.dart';
import 'core/network/dio/base_dio.dart';
import 'core/network/dio/dio_client.dart';
import 'core/network/dio/dio_interceptor.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
    validateStatus: (status) {
      // if (status == null) {
      //   return false;
      // }
      // if (status == 422 || status == 302) {
      //   return true;
      // } else {
      //   return status >= 200 && status < 300;
      // }
      return status != null && status < 500;
    },
    baseUrl: EndPoints.baseUrl,
    followRedirects: false,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  getIt.registerSingleton<BaseDio>(
      DioClient(options: options, dio: Dio(), interceptors: [
    DioInterceptor(),
  ]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerDataSources() {
  getIt.registerSingleton<ItemsDataSource>(ItemsDataSourceImpl(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<ItemRepo>(ItemRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<ItemCubit>(() => ItemCubit(getIt()));
}
