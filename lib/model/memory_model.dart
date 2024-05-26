import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory_model.freezed.dart';
part 'memory_model.g.dart';

@freezed
class MemoryModel with _$MemoryModel {
  const factory MemoryModel({
    required DateTime date,
    required String memo,
    required String imagePath,
  }) = _MemoryModel;

  factory MemoryModel.fromJson(Map<String, dynamic> json) =>
      _$MemoryModelFromJson(json);
}
