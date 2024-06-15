import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mvvm_training/pages/add_text_page.dart';
import 'package:photo_manager/photo_manager.dart';

class AddImagePage extends HookWidget {
  const AddImagePage({super.key});

  Future<List<AssetEntity>> fetchLocalPhotos() async {
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    final List<AssetEntity> images =
        await albums[0].getAssetListPaged(size: 60, page: 0);
    return images;
  }

  @override
  Widget build(BuildContext context) {
    final localPhotos = useState<List<AssetEntity>>([]);
    final thumbnailFutures =
        useState<Map<int, Future<Uint8List?>>>(<int, Future<Uint8List?>>{});
    final selectedPhotoIndex = useState<int>(0);

    void setLocalPhotos() async {
      try {
        final result = await PhotoManager.requestPermissionExtend();

        if (!result.isAuth) {
          throw Exception('Permission not granted');
        }

        final List<AssetEntity> images = await fetchLocalPhotos();
        localPhotos.value = images;

        // futureオブジェクトはFutureBuilderの外で生成する
        // これはuseEffectで初回しか呼ばれないため、ここでfutureオブジェクトを生成しておくことで
        // それ以外での不要な生成を防ぐ
        // FutureBuilderの中で生成すると、不要なタイミングでfutureオブジェクトが再生成される。
        final Map<int, Future<Uint8List?>> futures = {};
        for (int i = 0; i < images.length; i++) {
          futures[i] =
              images[i].thumbnailDataWithSize(const ThumbnailSize(600, 600));
        }
        thumbnailFutures.value = futures;
      } catch (e) {
        return;
      }
    }

    useOnAppLifecycleStateChange((beforeState, currState) {
      switch (currState) {
        case AppLifecycleState.resumed:
          setLocalPhotos();
          break;
        default:
          break;
      }
    });

    useEffect(() {
      setLocalPhotos();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(child: Text('画像選択')),
        actions: [
          TextButton(
            onPressed: () async {
              final selectedImage = localPhotos.value[selectedPhotoIndex.value];
              final selecterFutureImage =
                  thumbnailFutures.value[selectedPhotoIndex.value];
              final imagePath =
                  await selectedImage.file.then((file) => file?.path);
              if (imagePath == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('画像の取得に失敗しました'),
                  ),
                );
                return;
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTextPage(
                      imagePath: imagePath, imageFuture: selecterFutureImage),
                ),
              );
            },
            child: const Text(
              '次へ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // if (thumbnailFutures.value[selectedPhotoIndex] != null)
          FutureBuilder<Uint8List?>(
            future: thumbnailFutures.value[selectedPhotoIndex.value],
            builder: (context, snapshot) {
              final bytes = snapshot.data;
              if (bytes == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 4 / 7,
                child: Image.memory(bytes, fit: BoxFit.cover),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0), // Add padding to the top
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: localPhotos.value.length,
                itemBuilder: (context, index) {
                  final future = thumbnailFutures.value[index];
                  return FutureBuilder<Uint8List?>(
                    future: future,
                    builder: (context, snapshot) {
                      final bytes = snapshot.data;
                      if (bytes == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return GestureDetector(
                        onTap: () {
                          selectedPhotoIndex.value = index;
                        },
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.0,
                              child: Image.memory(bytes, fit: BoxFit.cover),
                            ),
                            if (index == selectedPhotoIndex.value)
                              Container(
                                color: Colors.white.withOpacity(0.5),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
