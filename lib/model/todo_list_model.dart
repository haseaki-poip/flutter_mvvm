import 'package:freezed_annotation/freezed_annotation.dart';
import 'todo_model.dart'; // TodoModel のインポート

part 'todo_list_model.freezed.dart';
part 'todo_list_model.g.dart';

@freezed
class TodoListModel with _$TodoListModel {
  const factory TodoListModel({
    @Default([]) List<TodoModel> todos,
  }) = _TodoListModel;

  factory TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListModelFromJson(json);
}
