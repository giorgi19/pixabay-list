import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_back_button.dart';
import 'package:pixabay_list/data/dto/hits_data_model.dart';
import 'package:pixabay_list/features/pixabay_feed/widgets/feed_image.dart';

class FeedItemDetails extends StatelessWidget {
  const FeedItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hit = ModalRoute.of(context)?.settings.arguments as HitsDataModel?;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Item details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.9,
              child: FeedImage(
                imageUrl: hit?.largeImageURL ?? '',
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Size: ${hit?.imageSize ?? "N/A"}',
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Type: ${hit?.type ?? "N/A"}',
              overflow: TextOverflow.ellipsis,
            ),
            Flexible(
              child: Text(
                'Tags: ${hit?.tags ?? "N/A"}',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Divider(height: 20),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'User: ${hit?.user ?? "N/A"}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('Views: ${hit?.views ?? "N/A"}'),
                  Text('Likes: ${hit?.likes ?? "N/A"}'),
                  Text('Comments: ${hit?.comments ?? "N/A"}'),
                  Text('Downloads: ${hit?.downloads ?? "N/A"}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
