import 'package:freezed_annotation/freezed_annotation.dart';

part 'hits_data_model.freezed.dart';
part 'hits_data_model.g.dart';

@freezed
class HitsDataModel with _$HitsDataModel {
  const factory HitsDataModel({
    final int? id,
    final String? pageURL,
    final String? type,
  }) = _HitsDataModel;

  factory HitsDataModel.fromJson(Map<String, dynamic> json) =>
      _$HitsDataModelFromJson(json);
}
