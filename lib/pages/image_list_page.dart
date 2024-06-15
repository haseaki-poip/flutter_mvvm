import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_training/pages/add_image_page.dart';
import 'package:mvvm_training/pages/add_memory_page.dart';
import 'package:mvvm_training/state/memory_notifier.dart';

class ImageListPage extends ConsumerWidget {
  const ImageListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMemories = ref.watch(memoryNotifierProvider);
    final imageGridView = switch (asyncMemories) {
      AsyncData(:final value) => GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          children: [
            for (int index = 0; index < value.length; index++)
              Container(
                child: Image.file(
                  File(value[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };

    return Scaffold(
      body: imageGridView,
      floatingActionButton: SizedBox(
        width: 72.0,
        height: 72.0,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddImagePage()),
            );
          },
          tooltip: 'add image',
          backgroundColor: Colors.blue, // 色を指定
          child: const Icon(Icons.add,
              size: 40.0, color: Colors.white), // アイコンの大きさを大きく、色を白色に
        ),
      ),
    );
  }
}
