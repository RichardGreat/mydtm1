import 'dart:io';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 2500));
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox("online");
  SystemChrome.setPreferredOrientations(
    // [DeviceOrientation.portraitDown]).then(
      [
        DeviceOrientation.portraitUp, // DeviceOrientation.portraitDown
      ]).then(
        (_) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('qq', 'QQ'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),
        ],
        path: 'assets/lang', // <-- change the path of the translation files
        fallbackLocale: const Locale('uz', 'UZ'),
        // child: const GoFreeExamResult(),
        child: const MyApp(),
        // boxs.get("langId") == null ? ChooseLoginRegister() :MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var box = Hive.box("online");

  @override
  void initState() {
    // box.put("token", "ae365911b49f6137e195dcb874cb0c4f");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
        disconnectedContent: const Center(child: Text("Internet bilan oloqa yoq")),
        connectedContent: const Center(child: Text("Aloqa tiklandi")),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home:
          box.get("token").toString().length > 30

              ?
          const MainPages()
              :
          // const NewPassword(),
          const EnterFirst(),
        ));
  }
}
