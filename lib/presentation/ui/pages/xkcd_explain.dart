import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xkcd_code_challange/core/constants/constants.dart';
import 'package:xkcd_code_challange/presentation/controllers/xkcd_explain_controller.dart';

class XkcdExplain extends StatelessWidget {
  XkcdExplain({Key? key}) : super(key: key);
  final Completer<WebViewController> _webController = Completer<WebViewController>();
  final XkcdExplainController _controller = Get.put(XkcdExplainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Pages.xkcdExplain.getDisplayName),
        ),
        body: WebView(
          initialUrl: _controller.webAddress,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          },
        )
    );
  }
}
