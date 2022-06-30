import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage extends GetxController{
  Future<bool> saveFavoToStorage(List<int> storageValue) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.favoList.toString(), jsonEncode(storageValue));
    return true;
  }

  Future<void> saveLastIDToStorage(int lastID) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.lastID.toString(), lastID.toString());
  }

  List<int> getFavoFromStorage() {
    final box = GetStorage();
    return jsonDecode(box.read(CacheManagerKey.favoList.toString())).cast<int>();
  }

  String? getLastIDFromStorage() {
    final box = GetStorage();
    return box.read(CacheManagerKey.lastID.toString());
  }
}

enum CacheManagerKey { favoList, lastID }