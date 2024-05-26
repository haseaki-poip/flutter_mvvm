// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemoryModel _$MemoryModelFromJson(Map<String, dynamic> json) {
  return _MemoryModel.fromJson(json);
}

/// @nodoc
mixin _$MemoryModel {
  DateTime get date => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoryModelCopyWith<MemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryModelCopyWith<$Res> {
  factory $MemoryModelCopyWith(
          MemoryModel value, $Res Function(MemoryModel) then) =
      _$MemoryModelCopyWithImpl<$Res, MemoryModel>;
  @useResult
  $Res call({DateTime date, String memo, String imagePath});
}

/// @nodoc
class _$MemoryModelCopyWithImpl<$Res, $Val extends MemoryModel>
    implements $MemoryModelCopyWith<$Res> {
  _$MemoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? memo = null,
    Object? imagePath = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoryModelImplCopyWith<$Res>
    implements $MemoryModelCopyWith<$Res> {
  factory _$$MemoryModelImplCopyWith(
          _$MemoryModelImpl value, $Res Function(_$MemoryModelImpl) then) =
      __$$MemoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String memo, String imagePath});
}

/// @nodoc
class __$$MemoryModelImplCopyWithImpl<$Res>
    extends _$MemoryModelCopyWithImpl<$Res, _$MemoryModelImpl>
    implements _$$MemoryModelImplCopyWith<$Res> {
  __$$MemoryModelImplCopyWithImpl(
      _$MemoryModelImpl _value, $Res Function(_$MemoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? memo = null,
    Object? imagePath = null,
  }) {
    return _then(_$MemoryModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoryModelImpl implements _MemoryModel {
  const _$MemoryModelImpl(
      {required this.date, required this.memo, required this.imagePath});

  factory _$MemoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoryModelImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String memo;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'MemoryModel(date: $date, memo: $memo, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoryModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, memo, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoryModelImplCopyWith<_$MemoryModelImpl> get copyWith =>
      __$$MemoryModelImplCopyWithImpl<_$MemoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoryModelImplToJson(
      this,
    );
  }
}

abstract class _MemoryModel implements MemoryModel {
  const factory _MemoryModel(
      {required final DateTime date,
      required final String memo,
      required final String imagePath}) = _$MemoryModelImpl;

  factory _MemoryModel.fromJson(Map<String, dynamic> json) =
      _$MemoryModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get memo;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$MemoryModelImplCopyWith<_$MemoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
