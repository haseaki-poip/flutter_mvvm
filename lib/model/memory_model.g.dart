// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoryModelImpl _$$MemoryModelImplFromJson(Map<String, dynamic> json) =>
    _$MemoryModelImpl(
      date: DateTime.parse(json['date'] as String),
      memo: json['memo'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$MemoryModelImplToJson(_$MemoryModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'memo': instance.memo,
      'imagePath': instance.imagePath,
    };
