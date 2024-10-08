import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeedImage extends StatelessWidget {
  const FeedImage({
    required this.imageUrl,
    this.progressIndicatorBuilder,
    super.key,
  });

  /// The aspect ratio of this image.
  static const _aspectRatio = 3 / 2;

  /// The url of this image.
  final String imageUrl;

  /// Widget displayed while the target [imageUrl] is loading.
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: progressIndicatorBuilder,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
