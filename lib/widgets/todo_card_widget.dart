import 'package:flutter/material.dart';
import 'package:mvvm_training/model/todo_model.dart';

class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget(
      {super.key, required this.todo, required this.handleCheckBox});

  final TodoModel todo;
  final VoidCallback handleCheckBox;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(todo.todo),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? value) {
          handleCheckBox();
        },
      ),
    ));
  }
}
