part of 'pixabay_feed_cubit.dart';

@freezed
class PixabayFeedState with _$PixabayFeedState {
  const factory PixabayFeedState.initial() = _Initial;
  const factory PixabayFeedState.loading() = _Loading;
  const factory PixabayFeedState.loaded(
      {required List<PixabayDataModel> data}) = _Loaded;
  const factory PixabayFeedState.failed({
    required String? error,
  }) = _Failed;
}
