import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';
import 'package:mydtm/view/notification/home_page.dart';


var webSocket = NotificationService();

Future<void> initializeService() async {
   DartPluginRegistrant.ensureInitialized();
  final service = FlutterBackgroundService();


  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart: true,
          onForeground: onStart,
          onBackground: onIosBackground),

      androidConfiguration: AndroidConfiguration(
          onStart: onStart, isForegroundMode: false, autoStart: true));

   await service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on("setAsForeground").listen((event) {
      service.setAsBackgroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  if (service is IOSServiceInstance) {
    service.on("setAsForeground").listen((event) {
      // service.
    });

    service.on('setAsBackground').listen((event) {

    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // Timer.periodic(const Duration(seconds: 1), (timer) async {
  //
  //   if (service is AndroidServiceInstance) {
  //     if (await service.isForegroundService()) {
  //       service.setForegroundNotificationInfo(
  //           title: "SCRIPT ACADEMY", content: "sub my channel");
  //     }
  //   }

  // if(service is IOSServiceInstance){

  webSocket.checkAction();
  // NotificationService.showNotification('Salom Task', 'This is a background notification.');

  // print(timer.tick.toString());
  service.invoke("update");
  // });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}
