import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_training/model/memory_model.dart';
import 'package:mvvm_training/state/memory_notifier.dart';
import 'package:mvvm_training/widgets/memory_form_widget.dart';

class ImageAddPage extends ConsumerWidget {
  const ImageAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addMemory(MemoryModel memory) {
      ref.read(memoryNotifierProvider.notifier).add(memory);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Image'),
      ),
      body: Center(
        child: MemoryFormWidget(onSubmit: addMemory),
      ),
    );
  }
}
