import 'package:flutter/material.dart';
import 'package:xkcd_code_challange/app.dart';
import 'package:xkcd_code_challange/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();

  runApp(const App());
}