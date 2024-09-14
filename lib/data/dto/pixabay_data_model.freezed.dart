// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixabay_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixabayDataModel _$PixabayDataModelFromJson(Map<String, dynamic> json) {
  return _PixabayDataModel.fromJson(json);
}

/// @nodoc
mixin _$PixabayDataModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this PixabayDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixabayDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixabayDataModelCopyWith<PixabayDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayDataModelCopyWith<$Res> {
  factory $PixabayDataModelCopyWith(
          PixabayDataModel value, $Res Function(PixabayDataModel) then) =
      _$PixabayDataModelCopyWithImpl<$Res, PixabayDataModel>;
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class _$PixabayDataModelCopyWithImpl<$Res, $Val extends PixabayDataModel>
    implements $PixabayDataModelCopyWith<$Res> {
  _$PixabayDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixabayDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixabayDataModelImplCopyWith<$Res>
    implements $PixabayDataModelCopyWith<$Res> {
  factory _$$PixabayDataModelImplCopyWith(_$PixabayDataModelImpl value,
          $Res Function(_$PixabayDataModelImpl) then) =
      __$$PixabayDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class __$$PixabayDataModelImplCopyWithImpl<$Res>
    extends _$PixabayDataModelCopyWithImpl<$Res, _$PixabayDataModelImpl>
    implements _$$PixabayDataModelImplCopyWith<$Res> {
  __$$PixabayDataModelImplCopyWithImpl(_$PixabayDataModelImpl _value,
      $Res Function(_$PixabayDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixabayDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$PixabayDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixabayDataModelImpl implements _PixabayDataModel {
  const _$PixabayDataModelImpl(
      {required this.id, required this.name, required this.email});

  factory _$PixabayDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixabayDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'PixabayDataModel(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixabayDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  /// Create a copy of PixabayDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixabayDataModelImplCopyWith<_$PixabayDataModelImpl> get copyWith =>
      __$$PixabayDataModelImplCopyWithImpl<_$PixabayDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixabayDataModelImplToJson(
      this,
    );
  }
}

abstract class _PixabayDataModel implements PixabayDataModel {
  const factory _PixabayDataModel(
      {required final String id,
      required final String name,
      required final String email}) = _$PixabayDataModelImpl;

  factory _PixabayDataModel.fromJson(Map<String, dynamic> json) =
      _$PixabayDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of PixabayDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixabayDataModelImplCopyWith<_$PixabayDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
