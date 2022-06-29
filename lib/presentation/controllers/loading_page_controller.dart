import 'package:get/get.dart';
import 'package:xkcd_code_challange/core/constants/constants.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

class LoadingPageController extends GetxController {
  LoadingPageController();

  final DataBaseService _db = Get.find();
  RxString msg = RxString('Loading Comic Strips');

  @override
  void onInit() async {
    super.onInit();
    if (_db.lastComicID.value == -1){
      await _db.getLastComic();
      Get.offNamed(Pages.homePage.name);
    } else {
      msg.value = 'Loading More Strips';
      await _db.fillComicsList();
      Get.offNamed(Pages.homePage.name);
    }
  }
}
