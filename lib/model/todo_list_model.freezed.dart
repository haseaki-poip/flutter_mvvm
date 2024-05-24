// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) {
  return _TodoListModel.fromJson(json);
}

/// @nodoc
mixin _$TodoListModel {
  List<TodoModel> get todos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoListModelCopyWith<TodoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListModelCopyWith<$Res> {
  factory $TodoListModelCopyWith(
          TodoListModel value, $Res Function(TodoListModel) then) =
      _$TodoListModelCopyWithImpl<$Res, TodoListModel>;
  @useResult
  $Res call({List<TodoModel> todos});
}

/// @nodoc
class _$TodoListModelCopyWithImpl<$Res, $Val extends TodoListModel>
    implements $TodoListModelCopyWith<$Res> {
  _$TodoListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoListModelImplCopyWith<$Res>
    implements $TodoListModelCopyWith<$Res> {
  factory _$$TodoListModelImplCopyWith(
          _$TodoListModelImpl value, $Res Function(_$TodoListModelImpl) then) =
      __$$TodoListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoModel> todos});
}

/// @nodoc
class __$$TodoListModelImplCopyWithImpl<$Res>
    extends _$TodoListModelCopyWithImpl<$Res, _$TodoListModelImpl>
    implements _$$TodoListModelImplCopyWith<$Res> {
  __$$TodoListModelImplCopyWithImpl(
      _$TodoListModelImpl _value, $Res Function(_$TodoListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
  }) {
    return _then(_$TodoListModelImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoListModelImpl implements _TodoListModel {
  const _$TodoListModelImpl({final List<TodoModel> todos = const []})
      : _todos = todos;

  factory _$TodoListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoListModelImplFromJson(json);

  final List<TodoModel> _todos;
  @override
  @JsonKey()
  List<TodoModel> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'TodoListModel(todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListModelImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListModelImplCopyWith<_$TodoListModelImpl> get copyWith =>
      __$$TodoListModelImplCopyWithImpl<_$TodoListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoListModelImplToJson(
      this,
    );
  }
}

abstract class _TodoListModel implements TodoListModel {
  const factory _TodoListModel({final List<TodoModel> todos}) =
      _$TodoListModelImpl;

  factory _TodoListModel.fromJson(Map<String, dynamic> json) =
      _$TodoListModelImpl.fromJson;

  @override
  List<TodoModel> get todos;
  @override
  @JsonKey(ignore: true)
  _$$TodoListModelImplCopyWith<_$TodoListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
