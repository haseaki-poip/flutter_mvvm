import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_training/pages/add_todo_page.dart';
import 'package:mvvm_training/state/todo_list.dart';
import 'package:mvvm_training/widgets/todo_card_widget.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodos = ref.watch(todoListNotifierProvider);

    final todoListView = switch (asyncTodos) {
      AsyncData(:final value) => ListView(
          children: [
            for (int index = 0; index < value.todos.length; index++)
              Padding(
                padding: EdgeInsets.only(top: index == 0 ? 32.0 : 8.0),
                child: TodoCardWidget(
                  todo: value.todos[index],
                  handleCheckBox: () {
                    ref
                        .read(todoListNotifierProvider.notifier)
                        .toggleTodoStatus(index);
                  },
                ),
              ),
          ],
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 233, 254),
      body: todoListView,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoPage()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
