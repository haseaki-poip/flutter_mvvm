import 'dart:convert';

import 'package:mvvm_training/model/memory_model.dart';
import 'package:mvvm_training/repository/memory_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryRepositoryImpl extends MemoryRepository {
  static const String _localDataKey = 'memory';

  @override
  Future<List<MemoryModel>> find() async {
    final prefs = await SharedPreferences.getInstance();
    final memoryJson = prefs.getString(_localDataKey);

    if (memoryJson == null) {
      return const [];
    }

    final List<dynamic> jsonList = json.decode(memoryJson);
    return jsonList.map((json) => MemoryModel.fromJson(json)).toList();
  }

  @override
  Future<void> save(List<MemoryModel> memoryList) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = memoryList.map((memory) => memory.toJson()).toList();
    await prefs.setString(_localDataKey, json.encode(jsonList));
  }
}
