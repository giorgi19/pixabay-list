import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/api/failure/failure.dart';

part 'general_failure.freezed.dart';

@freezed
class GeneralFailure with _$GeneralFailure implements Failure {
  const factory GeneralFailure.unknown(String message) = _Unknown;
}
