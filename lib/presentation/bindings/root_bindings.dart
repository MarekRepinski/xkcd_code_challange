import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
        DataBaseService(), permanent: true);
  }
}
