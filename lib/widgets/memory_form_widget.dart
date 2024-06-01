import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_training/model/memory_model.dart';

class MemoryFormWidget extends HookWidget {
  const MemoryFormWidget({super.key, required this.onSubmit});

  final void Function(MemoryModel) onSubmit;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final imageFile = useState<XFile?>(null);

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile.value = pickedFile;
      }
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageFile.value == null
                  ? const Text('No image selected.')
                  : Image.file(File(imageFile.value!.path)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick Image'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: textController,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your text here',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 60),
            child: ElevatedButton(
              onPressed: () {
                final memory = MemoryModel(
                  date: DateTime.now(),
                  memo: textController.text,
                  imagePath: imageFile.value!.path,
                );
                onSubmit(memory);
              },
              child: const Text('Register'),
            ),
          )
        ],
      ),
    );
  }
}
