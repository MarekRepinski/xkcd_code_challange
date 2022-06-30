import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xkcd_code_challange/app.dart';
import 'package:xkcd_code_challange/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  DependencyInjection.init();

  runApp(const App());
}