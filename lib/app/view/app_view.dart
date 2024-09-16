import 'package:flutter/material.dart';
import 'package:pixabay_list/app/routes/routes.dart';
import 'package:pixabay_list/app_ui/theme/app_theme.dart';
import 'package:pixabay_list/features/login/view/login.dart';
import 'package:pixabay_list/features/pixabay_feed/view/pixabay_feed.dart';
import 'package:pixabay_list/features/pixabay_feed/widgets/feed_item_details.dart';
import 'package:pixabay_list/features/registration/view/registration.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      routes: {
        AppRoutes.pixabayFeed: (context) => const PixabayFeed(),
        AppRoutes.registration: (context) => const Registration(),
        AppRoutes.feedItemDetails: (context) => const FeedItemDetails(),
      },
      home: const Login(),
    );
  }
}
