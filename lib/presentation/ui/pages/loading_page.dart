import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xkcd_code_challange/presentation/controllers/loading_page_controller.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);
  final _controller = Get.put(LoadingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(_controller.msg.value),
          ),
        ],
      ),
    ));
  }
}
