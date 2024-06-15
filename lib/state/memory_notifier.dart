import 'package:mvvm_training/model/memory_model.dart';
import 'package:mvvm_training/state/memory_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_notifier.g.dart';

@Riverpod(keepAlive: true)
class MemoryNotifier extends _$MemoryNotifier {
  @override
  Future<List<MemoryModel>> build() async {
    await Future.delayed(const Duration(seconds: 5));
    final memoryRepository = ref.watch(memoryRepositoryProvider);
    List<MemoryModel> memoryList = await memoryRepository.find();
    return memoryList;
  }

  Future<void> add(MemoryModel memory) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final memoryRepository = ref.watch(memoryRepositoryProvider);
      List<MemoryModel> currentMemoryList = await memoryRepository.find();
      List<MemoryModel> newMemoryList = [...currentMemoryList, memory];
      await memoryRepository.save(newMemoryList);
      return newMemoryList;
    });
  }
}
