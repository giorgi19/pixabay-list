import 'package:freezed_annotation/freezed_annotation.dart';

part 'hits_data_model.freezed.dart';
part 'hits_data_model.g.dart';

@freezed
class HitsDataModel with _$HitsDataModel {
  const factory HitsDataModel({
    final int? id,
    final String? pageURL,
    final String? type,
    final String? tags,
    final String? previewURL,
    final int? previewWidth,
    final int? previewHeight,
    final String? webformatURL,
    final int? webformatWidth,
    final int? webformatHeight,
    final String? largeImageURL,
    final String? fullHDURL,
    final String? imageURL,
    final int? imageWidth,
    final int? imageHeight,
    final int? imageSize,
    final int? views,
    final int? downloads,
    final int? likes,
    final int? comments,
    @JsonKey(name: 'user_id') final int? userId,
    final String? user,
    final String? userImageURL,
  }) = _HitsDataModel;

  factory HitsDataModel.fromJson(Map<String, dynamic> json) =>
      _$HitsDataModelFromJson(json);
}
