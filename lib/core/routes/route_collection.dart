import 'package:get/get.dart';
import 'package:xkcd_code_challange/core/constants/constants.dart';
import 'package:xkcd_code_challange/presentation/ui/pages/pages.dart';

class RouteCollection {
  RouteCollection._();

  static final routeCollection = [
    GetPage(
      name: Pages.homePage.name,
      page: () => HomePage(),
    ),
    GetPage(
      name: Pages.loading.name,
      page: () => LoadingPage(),
    ),
    GetPage(
      name: Pages.xkcdExplain.name,
      page: () => XkcdExplain(),
    ),
  ];
}
