import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.unauthenticated:
    case AppStatus.authenticated:
      return [];
    // HomePage.page()
  }
}

enum AppStatus {
  authenticated(),
  unauthenticated();

  bool get isLoggedIn => this == AppStatus.authenticated;
}
