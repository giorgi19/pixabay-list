import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  final bool showDebugLog;

  const AppBlocObserver({
    this.showDebugLog = false,
  });

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (showDebugLog) {
      log('${bloc.runtimeType}: $transition');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (showDebugLog) {
      log(
        '${bloc.runtimeType}',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (showDebugLog) {
      log('${bloc.runtimeType}: $change');
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (showDebugLog) {
      log('${bloc.runtimeType}: $event');
    }
  }
}
