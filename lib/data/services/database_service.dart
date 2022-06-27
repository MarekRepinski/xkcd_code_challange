import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/models/models.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

//Service for handling data
class DataBaseService extends GetxController {
  final HttpService httpService = Get.put(HttpService());
  Rxn<Comic> comic = Rxn<Comic>();
  RxInt lastComicID = RxInt(-1);
  RxInt currentComicID = RxInt(-1);

  @override
  void onInit() {
    super.onInit();
    getLastComic();
  }

  Future<void> getLastComic() async {
    comic.value = await httpService.getComic(null);
    if (comic.value != null){
      lastComicID.value = comic.value!.id;
    }
  }

  void changeCurrentMovieId(int val){
    if (val > lastComicID.value){val = lastComicID.value;}
    currentComicID.value = val;
  }

  Future<void> getComic() async {
    comic.value = await httpService.getComic(currentComicID.value);
  }
}

