import 'package:flutter/material.dart';
import 'package:pixabay_list/app/view/app_view.dart';

/// The app will handle global providers and repositories, such as user sessions, theme Management, App Language, analytics...
/// but these are not within the scope of the current requirements.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}
