import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xkcd_code_challange/core/constants/constants.dart';
import 'package:xkcd_code_challange/data/services/services.dart';
import 'package:share_plus/share_plus.dart';

class HomePageController extends GetxController {
  HomePageController();
  final DataBaseService _db = Get.find();

  Icon theFavoIcon = const Icon(
    Icons.favorite,
    color: Colors.red,
    size: 40,
  );
  Icon nonFavoIcon = const Icon(
    Icons.favorite_border,
    color: Colors.red,
    size: 40,
  );
  Rx<Icon> favoIcon = Rx<Icon>(const Icon(
    Icons.favorite,
    color: Colors.red,
    size: 40,
  ));

  @override
  void onInit() {
    super.onInit();
    favoIcon.value = setFavo(0);
  }

  void checkForLoading(int index) async {
    _db.currentComicIndex.value = index;
    Timer(const Duration(milliseconds: 500), () {
      favoIcon.value = setFavo(index);
    });
    if (index == _db.comicsList.length - 1) {
      await Future.delayed(const Duration(milliseconds: 500));
      Get.offNamed(Pages.loading.name);
    }
  }

  void sharePicture(index){
    Share.share(_db.comicsList[index].img);
  }

  void showExplaination(index){
    _db.changeCurrentComicID(_db.comicsList[index].id);
    Get.toNamed(Pages.xkcdExplain.name);
  }

  void toggleFavo(int index) {
    _db.toggleFavo(index);
    favoIcon.value = setFavo(index);
  }

  Icon setFavo(index) {
    if (_db.comicsList[index].favo) {
      return theFavoIcon;
    }
    return nonFavoIcon;
  }
}
