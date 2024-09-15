import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/widgets/app_error_state_widget.dart';
import 'package:pixabay_list/app_ui/widgets/app_loading_state_widget.dart';
import 'package:pixabay_list/data/data_sources/remote/pixabay_data_source.dart';
import 'package:pixabay_list/data/repository/i_pixabay_repository.dart';
import 'package:pixabay_list/features/pixabay_feed/cubit/pixabay_feed_cubit.dart';

class PixabayFeed extends StatelessWidget {
  const PixabayFeed({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PixabayFeedCubit(
          pixabayRepository: PixabayRepository(
            pixabayDataSource: PixabayDataSource(),
          ),
        )..getPixabayData(),
        child: const PixabayFeedView(),
      );
}

class PixabayFeedView extends StatelessWidget {
  const PixabayFeedView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PixabayFeedCubit, PixabayFeedState>(
        builder: (context, pixabayFeedState) => pixabayFeedState.when(
          initial: () => const Scaffold(),
          loading: () => const AppLoadingStateWidget(),
          loaded: (data) => const Scaffold(
            body: Center(child: SizedBox()),
          ),
          failed: (error) => AppErrorStateWidget(error: error),
        ),
      );
}
