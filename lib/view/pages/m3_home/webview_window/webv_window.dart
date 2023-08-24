// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWindow extends StatelessWidget {
  ServiceMainList modelServiceMainList;

  WebViewWindow({super.key, required this.modelServiceMainList});

  @override
  Widget build(BuildContext context) {
    final Uri _url2 = Uri.parse(modelServiceMainList.link);
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://www.youtube.com/")) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(_url2);
    return Scaffold(
      appBar: AppBar(
          title: Text(modelServiceMainList.serviceName.toString()),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.teal,
                    Colors.teal,
                    Colors.teal.withOpacity(0.8),]),
            ),
          ),
          elevation: 0),
      body: WebViewWidget(controller: controller),
    );
  }
}
