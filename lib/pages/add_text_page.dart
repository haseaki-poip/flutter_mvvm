import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_training/model/memory_model.dart';
import 'package:mvvm_training/pages/image_list_page.dart';
import 'package:mvvm_training/state/memory_notifier.dart';
import 'package:photo_manager/photo_manager.dart';

class AddTextPage extends ConsumerWidget {
  const AddTextPage(
      {super.key, required this.imagePath, required this.imageFuture});
  final String imagePath;
  final Future<Uint8List?>? imageFuture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();

    Future<void> addMemory() async {
      MemoryModel memory = MemoryModel(
          date: DateTime.now(),
          memo: textController.text,
          imagePath: imagePath);

      await ref.read(memoryNotifierProvider.notifier).add(memory);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('新規投稿'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Uint8List?>(
              future: imageFuture,
              builder: (context, snapshot) {
                final bytes = snapshot.data;
                if (bytes == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(15.0), // Add border radius
                      child: Image.memory(bytes, fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 2 / 7,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: '思い出を記録する',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 8 / 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // ラディウスを少し効かせる
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0), // ボタン内のテキストに対する上下の余白を追加
                  ),
                  onPressed: () async {
                    try {
                      await addMemory();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImageListPage(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('思い出を登録しました。'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('エラーが発生しました。'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    '投稿する',
                    style: TextStyle(
                      color: Colors.white, // テキスト色を白に設定
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
