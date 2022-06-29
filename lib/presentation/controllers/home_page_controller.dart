import 'dart:async';
import 'package:get/get.dart';
import 'package:xkcd_code_challange/core/constants/constants.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

class HomePageController extends GetxController {
  HomePageController();

  final DataBaseService _db = Get.find();

  void checkForLoading(int index) async {
    _db.currentComicIndex.value = index;
    if (index == _db.comicsList.length - 1) {
      await Future.delayed(const Duration(microseconds: 500));
      Get.offNamed(Pages.loading.name);
    }
  }
}
