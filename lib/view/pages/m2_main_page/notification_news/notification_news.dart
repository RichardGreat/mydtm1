import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/notification/back_service.dart';
import 'package:mydtm/view/pages/m2_main_page/notification_news/internet_news.dart';
import 'package:mydtm/view/pages/m2_main_page/notification_news/model_news.dart';
import 'package:mydtm/view/pages/m5_xabarlar/main_messages.dart';

class NotificationNews {
  List<ModelCheckNewsNotification> listModel = [];
  InternetCheckNews internetCheckNews = InternetCheckNews();


  // var box = Hive.box("online");
  checkDataInServer() async {
    try {
      await Hive.initFlutter();
      await Hive.openBox("online");
      var box = Hive.box("online");
       log("111");
      // await initializeService();
      // await init1234();

      listModel  = await internetCheckNews.getNews();
      log("222");
      if(box.get('newsCheck').toString() != listModel[0].id) {
        try{
          box.delete("newsCheck");
          box.put("newsCheck", listModel[0].id.toString());
          showNotification(listModel[0].id.toString(), listModel[0].title.toString(), listModel[0].summary.toString(), listModel[0].updateDate.toString());
        }catch(e){}
      }



    } catch (e) {
      log("^^^^^^^^");
      log(e.toString());
    }
  }

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin1234 = FlutterLocalNotificationsPlugin();

  static Future<void> init1234() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _flutterLocalNotificationsPlugin1234.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        try {
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => const MainMessages(
              index: 0,
            ),
          ));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  Future<void> showNotification(
      String id, String title, String body, String sendDate) async {


    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '101',
      'BMBA',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: DarwinNotificationDetails(
            presentBadge: true,
            presentAlert: true,
            subtitle: "",
            presentBanner: true));

    await _flutterLocalNotificationsPlugin1234.show(
        0, title, body, platformChannelSpecifics);
  }
}
