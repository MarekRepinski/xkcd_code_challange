import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/models/models.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

//Service for handling data
class DataBaseService extends GetxController {
  final HttpService httpService = Get.put(HttpService());
  Rxn<Comic> comic = Rxn<Comic>();
  RxList<Comic> comicsList = RxList<Comic>();
  RxInt lastComicID = RxInt(-1);
  RxInt currentComicIndex = RxInt(-1);
  int currentComicID = 0;
  int lastIndex = -1;
  int offSet = 20;

  Future<void> getLastComic() async {
    comic.value = await httpService.getComic(null);
    if (comic.value != null) {
      lastComicID.value = comic.value!.id;
      lastIndex = lastComicID.value;
      await fillComicsList();
    }
  }

  Future<void> fillComicsList() async {
    if (lastIndex > 0){
      int endIndex = lastIndex - offSet;
      if (endIndex < 0){endIndex = 0;}
      for (int i = lastIndex; i > endIndex; i--) {
        comicsList.add(await httpService.getComic(i));
      }
      lastIndex = endIndex;
    }
  }

  void changeCurrentComicIndex(int val) {
    if (val > lastComicID.value) {
      val = lastComicID.value;
    }
    currentComicIndex.value = val;
  }

  void changeCurrentComicID(int val) {
    currentComicID = val;
  }

  Future<void> getComic(int? index) async {
    comic.value = await httpService.getComic(index);
  }

  void toggleFavo(int id){
    //Should be stored in Back-end or at least in GetStorgae
    comicsList[id].favo = !comicsList[id].favo;
  }
}
