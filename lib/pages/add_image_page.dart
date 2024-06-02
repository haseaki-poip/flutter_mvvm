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

    void setLocalPhotos() async {
      try {
        final result = await PhotoManager.requestPermissionExtend();

        if (!result.isAuth) {
          throw Exception('Permission not granted');
        }

        final List<AssetEntity> images = await fetchLocalPhotos();
        localPhotos.value = images;
      } catch (e) {
        print('Error: $e');
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
      appBar: AppBar(title: Text('Gallery')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: localPhotos.value.length,
        itemBuilder: (context, index) {
          return FutureBuilder<Uint8List?>(
            future: localPhotos.value[index].thumbnailDataWithSize(
              const ThumbnailSize(200, 200),
            ),
            builder: (context, snapshot) {
              final bytes = snapshot.data;
              if (bytes == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Image.memory(bytes, fit: BoxFit.cover);
            },
          );
        },
      ),
    );
  }
}
