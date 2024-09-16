import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_error_state_widget.dart';
import 'package:pixabay_list/app_ui/widgets/app_loading_state_widget.dart';
import 'package:pixabay_list/data/data_sources/remote/pixabay_data_source.dart';
import 'package:pixabay_list/data/repository/i_pixabay_repository.dart';
import 'package:pixabay_list/features/pixabay_feed/cubit/pixabay_feed_cubit.dart';
import 'package:pixabay_list/features/pixabay_feed/widgets/feed_item.dart';

class PixabayFeed extends StatelessWidget {
  const PixabayFeed({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PixabayFeedCubit(
          pixabayRepository: PixabayRepository(
            pixabayDataSource: PixabayDataSource(),
          ),
        )..getPixabayData(),
        child: PixabayFeedView(
          scrollController: ScrollController(),
        ),
      );
}

class PixabayFeedView extends StatelessWidget {
  const PixabayFeedView({
    this.scrollController,
    super.key,
  });

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PixabayFeedCubit, PixabayFeedState>(
        builder: (context, pixabayFeedState) => pixabayFeedState.when(
          initial: () => const Scaffold(),
          loading: () => const AppLoadingStateWidget(),
          loaded: (data) => Scaffold(
            body: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Pixabay feed'),
                ),
                SliverFixedExtentList(
                  itemExtent: 300.0,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.md),
                      child: FeedItem(
                        hit: data.hits?[index],
                      ),
                    ),
                    childCount: data.hits?.length, // Number of items to display
                  ),
                ),
              ],
            ),
          ),
          failed: (error) => AppErrorStateWidget(error: error),
        ),
      );
}
