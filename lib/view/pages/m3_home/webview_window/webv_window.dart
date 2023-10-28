// ignore_for_file: must_be_immutable

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/check_cert.dart';
import 'package:mydtm/view/pages/check_certificate/check_sertificats.dart';
import 'package:mydtm/view/pages/m2_book_question/book_questions.dart';
import 'package:mydtm/view/pages/m3_home/main_home.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWindow extends StatefulWidget {
  ServiceMainList modelServiceMainList;

  WebViewWindow({super.key, required this.modelServiceMainList, });

  @override
  State<WebViewWindow> createState() => _WebViewWindowState();
}

class _WebViewWindowState extends State<WebViewWindow> {
  final List<IconData> icons = [
    Icons.search,
    Icons.book,
    // Icons.home,
    Icons.bookmark_add_outlined,
    Icons.bookmark_border_outlined,
  ];
  int currentIndex = -1;
  final List pages = [
    MainMyStatement(numberParam: "0"),
    const BookQuestions(),
    const CheckInfoCertificate(),
    const CheckCertificate(),
  ];

  void onItemTapped(int index) async {
    setState(() {
      currentIndex = index;
    });
  }

  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    MainMyStatement(numberParam: "0"),
    const BookQuestions(),
    const CheckInfoCertificate(),
    const CheckCertificate(),
    MainHome(homePageId: "0"),
  ];

  List<bool> listBool = [true, true, true, true, false];

  int _bottomNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    final Uri _url2 = Uri.parse(widget.modelServiceMainList.link );
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
      extendBodyBehindAppBar: true,

      extendBody: true,
      appBar: AppBar(
          title: Text(widget.modelServiceMainList.serviceName.toString()),
          // backgroundColor: Colors.transparent,
          // leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const Icon(Icons.arrow_back_outlined)),
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
      body:
      SafeArea(child:
      currentIndex == -1? WebViewWidget(controller: controller):bottomBarPages[_bottomNavIndex],)
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.home, color: _bottomNavIndex == 4 ?Colors.teal:Colors.grey),
      //   onPressed: () {
      //     _bottomNavIndex = 4;
      //     setState(() {});
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: icons,
      //   activeColor: Colors.teal,
      //   activeIndex: _bottomNavIndex,
      //   inactiveColor: Colors.grey,
      //   iconSize: 30,
      //   leftCornerRadius: 32,
      //   rightCornerRadius: 32,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   onTap: (index) => setState(() => _bottomNavIndex = index),
      //   //other params
      // ),
    );

  }
}
