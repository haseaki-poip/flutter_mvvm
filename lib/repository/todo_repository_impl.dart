import 'dart:convert';

import 'package:mvvm_training/model/todo_list_model.dart';
import 'package:mvvm_training/model/todo_model.dart';
import 'package:mvvm_training/repository/todo_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoRepositoryImpl extends TodoRepository {
  static const String _todosKey = 'todos';

  @override
  Future<List<TodoModel>> find() async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = prefs.getString(_todosKey);

    if (todosString == null) {
      return const [];
    }

    final List<dynamic> jsonList = json.decode(todosString);
    return jsonList.map((json) => TodoModel.fromJson(json)).toList();
  }

  @override
  Future<void> save(List<TodoModel> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = todos.map((todo) => todo.toJson()).toList();
    await prefs.setString(_todosKey, json.encode(jsonList));
  }
}
