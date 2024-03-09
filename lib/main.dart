import 'dart:async';
import 'dart:io';

import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/notification/back_service.dart';
import 'package:mydtm/view/notification/home_page.dart';
import 'package:mydtm/view/pages/m0_enter_page/first_enter_page.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m5_xabarlar/main_messages.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await ConnectionNotifierTools.initialize();
  await initializeService();
  await NotificationService.init();
  await FaceCamera.initialize();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("online");
  await Hive.openBox('online2');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('kk', 'KK'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale('uz', 'UZ'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var box = Hive.box("online");
  var box2 = Hive.box("online2");

  @override
  initState() {

    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      connectionNotificationOptions: const ConnectionNotificationOptions(
          alignment: Alignment.bottomCenter,
          disconnectedText: "Internet",
          connectedText: "Internet"),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // theme:  ThemeData(
        // colorSchemeSeed:  Colors.white),
        debugShowCheckedModeBanner: false,
        home:
            // AnimatedSplashScreen(
            //     duration: 2800,
            //     animationDuration: const Duration(milliseconds:  2800),
            //     splash: "assets/images/bmba.gif",
            //     splashIconSize: 150,
            //     nextScreen:
            box.get("language") == "1" ||
                    box.get("language") == "2" ||
                    box.get("language") == "3"
                ?
            box2.get("windowNews").toString() == "1"? MainMessages(index: 1,):
            MainPages(homeIdMainpage: "0")
                : const EnterFirst0(),
        // splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.fade,
        // backgroundColor: Colors.white)
      ),
    );
  }
}
