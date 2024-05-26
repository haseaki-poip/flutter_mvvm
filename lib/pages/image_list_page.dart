import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageListPage extends ConsumerWidget {
  const ImageListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> numberList = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10'
    ];

    return Scaffold(
      body: GridView.builder(
        itemCount: numberList.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.pink,
            child: Center(child: Text(numberList[index])),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          // childAspectRatio: 2.0,
        ),
      ),
      floatingActionButton: SizedBox(
        width: 72.0,
        height: 72.0,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => AddTodoPage()),
            // );
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
