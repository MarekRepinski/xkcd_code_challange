import 'package:get/get.dart';
import 'data/services/services.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<DataBaseService>(() => DataBaseService(), fenix: true);
  }
}