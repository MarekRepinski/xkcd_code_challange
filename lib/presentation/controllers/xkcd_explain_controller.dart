import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

class XkcdExplainController extends GetxController {
  final DataBaseService _db = Get.find();
  String webAddress = 'https://www.explainxkcd.com/wiki/index.php/';

  @override
  void onInit() {
    webAddress = webAddress + _db.currentComicID.toString();
    super.onInit();
  }
}
