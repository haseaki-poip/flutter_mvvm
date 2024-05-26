import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mvvm_training/model/memory_model.dart';
import 'package:mvvm_training/pages/image_list_page.dart';
import 'package:mvvm_training/state/memory_notifier.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<List<MemoryModel>>>(
      memoryNotifierProvider,
      (previous, next) {
        if (next is AsyncData) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImageListPage()),
          );
        } else if (next is AsyncError) {
          print('Error: ${next.error}');
          // エラーページに飛ばす
        }
      },
    );
    return Scaffold(
      body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.blue,
        size: 100,
      )),
    );
  }
}
