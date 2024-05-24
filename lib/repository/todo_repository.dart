import 'package:mvvm_training/model/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> find();
  Future<void> save(List<TodoModel> todos);
}
