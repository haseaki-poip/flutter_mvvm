import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_training/s1.dart';

class MyWidget1 extends ConsumerWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1 = ref.watch(s1NotifierProvider);

    ref.listen(s1NotifierProvider, ((previous, next) {
      if (next % 10 == 0) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Value is a multiple of 10'),
          duration: Duration(seconds: 2),
        ));
      }
    }));
    return Scaffold(
      body: Center(
          child: Text('$s1', style: Theme.of(context).textTheme.headlineLarge)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final notifier = ref.read(s1NotifierProvider.notifier);
          notifier.updateState();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
