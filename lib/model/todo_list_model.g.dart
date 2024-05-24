// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoListModelImpl _$$TodoListModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoListModelImpl(
      todos: (json['todos'] as List<dynamic>?)
              ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TodoListModelImplToJson(_$TodoListModelImpl instance) =>
    <String, dynamic>{
      'todos': instance.todos,
    };
