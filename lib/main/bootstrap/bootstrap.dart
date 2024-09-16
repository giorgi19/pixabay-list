import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:pixabay_list/data/api/api_client.dart';
import 'package:pixabay_list/data/data_sources/local/storage/token_storage.dart';
import 'package:pixabay_list/main/bootstrap/app_bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

/// A fully implemented get_it is not necessary for this project due to the small number of dependencies.
void setupLocator() {
  locator.registerLazySingleton<Dio>(Dio.new);
  locator.registerLazySingleton<InMemoryTokenStorage>(InMemoryTokenStorage.new);
  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: 'https://pixabay.com/api/',
      httpClient: locator<Dio>(),
      tokenProvider: locator<InMemoryTokenStorage>().readToken,
    ),
  );
}

typedef AppBuilder = Future<Widget> Function(
  SharedPreferences sharedPreferences,
);

Future<void> bootstrap(AppBuilder builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      await dotenv.load();
      WidgetsFlutterBinding.ensureInitialized();
      final sharedPreferences = await SharedPreferences.getInstance();
      setupLocator();
      const blocObserver = AppBlocObserver(showDebugLog: true);
      Bloc.observer = blocObserver;

      runApp(
        await builder(
          sharedPreferences,
        ),
      );
    },
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
