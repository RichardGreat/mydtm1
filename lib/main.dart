import 'dart:io';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mydtm/view/pages/m0_enter_page/first_enter_page.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'dart:async';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 1900));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox("online");
  await initialization(null);
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
//
// Future initializations()async{
// await Future.delayed(const Duration(milliseconds: 1800));
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var box = Hive.box("online");
  LocalAuthentication auth = LocalAuthentication();

  Future<void> localAuth(BuildContext context) async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.fingerprint)) {}
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        // Handle this case
        break;
      case AppLifecycleState.detached:
        {}
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  initState() {
    // screenLock123();
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
      disconnectedContent: Center(child: Text("noInternetConn".tr())),
      connectedContent: Center(child: Text("internetConn".tr())),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: box.get("language") == "1" ||
                box.get("language") == "2" ||
                box.get("language") == "3"
            ? //MainPages()//
            MainPages()
            : const EnterFirst0(),
      ),
    );
  }
}
