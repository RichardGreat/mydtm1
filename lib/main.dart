import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m0_enter_page/first_enter_page.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'dart:async';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:page_transition/page_transition.dart';


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
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.remove();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.appColorBBA(), // status bar color
  ));
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox("online");
  await initialization(null);
  // final config = TalsecConfig(
  //   /// For Android
  //   androidConfig: AndroidConfig(
  //     packageName: 'www.uzbmba.uz',
  //     signingCertHashes: [
  //       'bNSrT49K4aceo7I8iMlohhDtRS0e7kcGeMiH4jSKYaE='
  //     ],
  //     supportedStores: ['some.other.store'],
  //   ),
  //   watcherMail: 'tojiyev.s.b@gmail.com',
  //   isProd: true,
  // );
  // final callback = ThreatCallback(
  //     onAppIntegrity: () => print("App integrity"),
  //     onObfuscationIssues: () => print("Obfuscation issues"),
  //     onDebug: () => print("Debugging"),
  //     onDeviceBinding: () => print("Device binding"),
  //     onDeviceID: () => print("Device ID"),
  //     onHooks: () => print("Hooks"),
  //     onPasscode: () => print("Passcode not set"),
  //     onPrivilegedAccess: () => print("Privileged access"),
  //     onSecureHardwareNotAvailable: () => print("Secure hardware not available"),
  //     onSimulator: () => print("Simulator"),
  //     onUnofficialStore: () => print("Unofficial store")
  // );
  //
  // // Attaching listener
  // Talsec.instance.attachListener(callback);
  //
  //
  // await Talsec.instance.start(config);
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
// FlutterNativeSplash.remove();
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
  // LocalAuthentication auth = LocalAuthentication();
  //
  // Future<void> localAuth(BuildContext context) async {
  //   final List<BiometricType> availableBiometrics =
  //       await auth.getAvailableBiometrics();
  //   if (availableBiometrics.contains(BiometricType.face) ||
  //       availableBiometrics.contains(BiometricType.fingerprint)) {}
  // }

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
      disconnectedContent: const Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4),
          SizedBox(width: 10),
          Text("Internet", style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      )),
      connectedContent:const Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.check_mark_circled_solid),
          SizedBox(width: 10),
          Text("Internet", style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      )),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

    theme:  ThemeData(
    colorSchemeSeed:  Colors.white),
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
            MainPages(homeIdMainpage: "0",)
                : const EnterFirst0(),
            // splashTransition: SplashTransition.fadeTransition,
            // pageTransitionType: PageTransitionType.fade,
            // backgroundColor: Colors.white)
      ),
    );
  }
}