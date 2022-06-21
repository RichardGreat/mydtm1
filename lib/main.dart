import 'dart:io';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m0_enter_page/first_enter_page.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password_in/change_password_input.dart';

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
        supportedLocales: [
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

class _MyAppState extends State<MyApp> {
  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      disconnectedContent:
           Center(child: Text("noInternetConn".tr())),
      connectedContent:  Center(child: Text("internetConn".tr())),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: box.get("language") == "1" ||
                box.get("language") == "2" ||
                box.get("language") == "3"
            ? const MainPages()
            :
           const EnterFirst0(),
      ),
    );
  }
}
