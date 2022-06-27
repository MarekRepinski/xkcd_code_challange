import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xkcd_code_challange/core/routes/route_collection.dart';
import 'package:xkcd_code_challange/presentation/bindings/root_bindings.dart';

import 'core/constants/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App Mobile - Level 1',
      initialBinding: RootBindings(),
      theme: basicTheme(),
      initialRoute: Pages.homePage.name,
      getPages: RouteCollection.routeCollection,
    );
  }
}
