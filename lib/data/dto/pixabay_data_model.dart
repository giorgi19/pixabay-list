import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_data_model.freezed.dart';
part 'pixabay_data_model.g.dart';

@freezed
class PixabayDataModel with _$PixabayDataModel {
  const factory PixabayDataModel({
    required String id,
    required String name,
    required String email,
  }) = _PixabayDataModel;

  factory PixabayDataModel.fromJson(Map<String, dynamic> json) =>
      _$PixabayDataModelFromJson(json);
}
