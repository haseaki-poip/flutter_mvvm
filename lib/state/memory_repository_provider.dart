import 'package:mvvm_training/repository/memory_repository.dart';
import 'package:mvvm_training/repository/memory_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_repository_provider.g.dart';

@riverpod
MemoryRepository memoryRepository(MemoryRepositoryRef ref) {
  return MemoryRepositoryImpl();
}
