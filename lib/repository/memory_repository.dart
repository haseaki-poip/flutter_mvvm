import 'package:mvvm_training/model/memory_model.dart';

abstract class MemoryRepository {
  Future<List<MemoryModel>> find();
  Future<void> save(List<MemoryModel> mmemoryList);
}
