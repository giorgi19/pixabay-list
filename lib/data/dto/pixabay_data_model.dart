import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/dto/hits_data_model.dart';

part 'pixabay_data_model.freezed.dart';
part 'pixabay_data_model.g.dart';

@freezed
class PixabayDataModel with _$PixabayDataModel {
  const factory PixabayDataModel({
    final int? total,
    final int? totalHits,
    final List<HitsDataModel>? hits,
  }) = _PixabayDataModel;

  factory PixabayDataModel.fromJson(Map<String, dynamic> json) =>
      _$PixabayDataModelFromJson(json);
}
