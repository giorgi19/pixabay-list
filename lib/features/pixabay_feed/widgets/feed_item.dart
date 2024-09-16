import 'package:flutter/material.dart';
import 'package:pixabay_list/app/routes/routes.dart';
import 'package:pixabay_list/data/dto/hits_data_model.dart';
import 'package:pixabay_list/features/pixabay_feed/widgets/feed_image.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({
    required this.hit,
    super.key,
  });

  final HitsDataModel? hit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.feedItemDetails,
        arguments: hit,
      ),
      child: Card(
        child: Column(
          key: const Key('feed_column'),
          children: [
            SizedBox(
              height: 250,
              child: FeedImage(
                imageUrl: hit?.largeImageURL ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Text(hit?.user ?? ''),
          ],
        ),
      ),
    );
  }
}
