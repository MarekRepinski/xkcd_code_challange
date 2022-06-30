import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/models/models.dart';
import 'package:xkcd_code_challange/data/services/services.dart';

//Service for handling data
class DataBaseService extends GetxController {
  final HttpService httpService = Get.put(HttpService());
  final Storage _storage = Get.put(Storage());
  Rxn<Comic> comic = Rxn<Comic>();
  RxList<Comic> comicsList = RxList<Comic>();
  RxInt lastComicID = RxInt(-1);
  RxInt currentComicIndex = RxInt(-1);
  RxBool newStrip = RxBool(false);
  int currentComicID = 0;
  int lastIndex = -1;
  int offSet = 20;
  List<int> favoList = [];

  Future<void> getLastComic() async {
    comic.value = await httpService.getComic(null);
    if (comic.value != null) {
      lastComicID.value = comic.value!.id;
      lastIndex = lastComicID.value;
      int? lastLastID = int.tryParse(_storage.getLastIDFromStorage() ?? '');
      if (lastLastID == null || lastLastID < lastComicID.value){
        newStrip.value = true;
      }
      await _storage.saveLastIDToStorage(lastComicID.value);
      favoList = _storage.getFavoFromStorage();
      await fillComicsList();
    }
  }

  Future<void> fillComicsList() async {
    if (lastIndex > 0){
      int endIndex = lastIndex - offSet;
      if (endIndex < 0){endIndex = 0;}
      for (int i = lastIndex; i > endIndex; i--) {
        comicsList.add(await httpService.getComic(i));
        if (favoList.contains(comicsList[comicsList.length-1].id)){
          comicsList[comicsList.length-1].favo = true;
        }
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

  void turnoutNewStripValue(){
    newStrip.value = false;
  }

  void changeCurrentComicID(int val) {
    currentComicID = val;
  }

  Future<void> getComic(int? index) async {
    comic.value = await httpService.getComic(index);
  }

  void toggleFavo(int id){
    comicsList[id].favo = !comicsList[id].favo;
    storeFavoList(comicsList[id].favo, comicsList[id].id);
  }

  void storeFavoList(bool addItem, int id){
    if (addItem) {
      favoList.add(id);
    } else {
      favoList.remove(id);
    }
    _storage.saveFavoToStorage(favoList);
  }
}
