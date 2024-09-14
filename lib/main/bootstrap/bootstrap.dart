import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pixabay_list/api/failure/api_client.dart';
import 'package:pixabay_list/main/bootstrap/app_bloc_observer.dart';
import 'package:pixabay_list/storage/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

/// This is for demonstration purposes: I am using get_it for the API client.
/// A fully implemented get_it is not necessary for this project until the dependencies grow.
/// For now, I will use constructor dependency injection, except the API.
void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: 'base url',
      httpClient: locator<Dio>(),
      tokenProvider: InMemoryTokenStorage().readToken,
    ),
  );
}

typedef AppBuilder = Future<Widget> Function(
  SharedPreferences sharedPreferences,
);

Future<void> bootstrap(AppBuilder builder) async {
  const blocObserver = AppBlocObserver();
  Bloc.observer = blocObserver;

  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final sharedPreferences = await SharedPreferences.getInstance();
      setupLocator();
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
