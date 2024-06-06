import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final selectedPhoto = useState<AssetEntity?>(null);

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
              images[i].thumbnailDataWithSize(const ThumbnailSize(200, 200));
        }
        thumbnailFutures.value = futures;

        selectedPhoto.value = images[0];
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

    // futureオブジェクトはFutureBuilderの外で生成する。
    // useMemoizedは適切なタイミングでしか、実行されないため、不要なfutureオブジェクトの再生成を行わない
    // FutureBuilderの中で生成すると不要な再生成がされる
    final selectedPhotoFuture = useMemoized(() {
      return selectedPhoto.value
          ?.thumbnailDataWithSize(const ThumbnailSize(600, 600));
    }, [selectedPhoto.value]);

    return Scaffold(
      appBar: AppBar(title: Text('画像選択')),
      body: Column(
        children: [
          if (selectedPhoto.value != null)
            FutureBuilder<Uint8List?>(
              future: selectedPhotoFuture,
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        return Center(child: CircularProgressIndicator());
                      }
                      return GestureDetector(
                        onTap: () {
                          selectedPhoto.value = localPhotos.value[index];
                        },
                        child: Image.memory(bytes, fit: BoxFit.cover),
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
