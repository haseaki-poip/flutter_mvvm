import 'package:mvvm_training/repository/todo_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/todo_list_model.dart';
import '../model/todo_model.dart';
part 'todo_list.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  Future<TodoListModel> build() async {
    // 初期状態を設定
    TodoListModel todoList =
        TodoListModel(todos: await TodoRepositoryImpl().find());
    return todoList;
  }

  // Todo アイテムをリストに追加するメソッド
  Future<void> addTodo(TodoModel todo) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      List<TodoModel> currentData = await TodoRepositoryImpl().find();
      var newTodos = [...currentData, todo];
      await TodoRepositoryImpl().save(newTodos);
      return TodoListModel(todos: newTodos);
    });
  }

  // Todo アイテムの完了状態をトグルするメソッド
  Future<void> toggleTodoStatus(int index) async {
    // state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      List<TodoModel> currentData = await TodoRepositoryImpl().find();
      TodoModel updatedTodo = currentData[index]
          .copyWith(isCompleted: !currentData[index].isCompleted);

      var updatedTodos = [...currentData];
      updatedTodos[index] = updatedTodo;

      await TodoRepositoryImpl().save(updatedTodos);
      return TodoListModel(todos: updatedTodos);
    });
  }
}
