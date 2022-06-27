import 'dart:convert';
import 'package:http/http.dart';
import 'package:xkcd_code_challange/data/models/models.dart';

//Service for getting data
class HttpService {
  final String comicLinkHead = 'https://xkcd.com';
  final String comicLinkTail = '/info.0.json';

  Future<Comic> getComic(int? id) async {
    String comicLink = comicLinkHead + comicLinkTail;

    Comic comic = Comic(
      id: -1,
      safeTitle: 'no title',
      title: 'no title',
      img: '',
      alt: '',
      year: '',
      month: '',
      day: '',
      transcript: '',
      link: '',
      news: '',
    );

    if (id != null) {
      comicLink = '$comicLinkHead/$id.toString()$comicLinkTail';
    }

    Response res = await get(Uri.parse(comicLink));

    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      comic = Comic.fromJson(map);
    } else {
      throw "Cant get strip";
    }

    return comic;
  }
}
