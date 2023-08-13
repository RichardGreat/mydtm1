// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTelegram extends StatefulWidget {
  String urlService;
  String titleName;

  WebViewTelegram({super.key, required this.urlService, required this.titleName});

  @override
  State<WebViewTelegram> createState() => _WebViewTelegramState();
}

class _WebViewTelegramState extends State<WebViewTelegram> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
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
    ..loadRequest(Uri.parse("https://t.me/e_dtm_bot"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(widget.titleName), elevation: 0),
      body: WebViewWidget(controller: controller),
    );
  }
}
