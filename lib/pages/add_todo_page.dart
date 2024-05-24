import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_training/model/todo_model.dart';
import 'package:mvvm_training/state/todo_list.dart';

class AddTodoPage extends ConsumerWidget {
  AddTodoPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Todo',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  final newTodo = TodoModel(
                    date: DateTime.now(),
                    todo: value,
                  );
                  ref.read(todoListNotifierProvider.notifier).addTodo(newTodo);
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final textFieldValue = _controller.text;
                if (textFieldValue.isNotEmpty) {
                  final newTodo = TodoModel(
                    date: DateTime.now(),
                    todo: textFieldValue,
                  );
                  ref.read(todoListNotifierProvider.notifier).addTodo(newTodo);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
