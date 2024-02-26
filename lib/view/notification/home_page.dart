import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/m5_xabarlar/main_messages.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationService {
  String dataSocket = "";
  List<ModelSocketMessage> dataParseList = [];

  Future checkAction() async {
    await Hive.initFlutter();
    await Hive.openBox("online");
    var box = Hive.box("online");
    box.put("workNot", "1");
    if (box.get("listenServer").toString() == "null") {
      box.put("listenServer", "0");
    }

    Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {

        log("sobir".toString());
        log(box.get("listenServer").toString());
        if ((await getImie()).toString().length > 12 &&
            ((await getInternetConnection()) == "connected")) {

          if (box.get("listenServer").toString() == "0") {

            if (box.get("workNot").toString() == "0" || box.get("workNot").toString() == "null" ) {
              listenServer();
              box.put("workNot", "0");
            }
          } else {
            box.put("listenServer", "1");
          }
        }
      } catch (e) {
        box.put("listenServer", "1");
      }
    });
  }

  Future listenServer() async {
    try {
      await Hive.initFlutter();
      await Hive.openBox("online");
      final box = Hive.box("online");
      try {
        final wsUrl = Uri.parse("wss://uzbmb.uz/websockets");
        final channel = WebSocketChannel.connect(wsUrl);
        await channel.ready;
        log("listenServer 123457");

        channel.stream.listen(
          (message) {
            try {
              channel.sink.add(
                  "{\"action\": \"start\", \"data\": \"${box.get("imie").toString()}\"}");

              if (message.toString().contains("finish")) {
              } else {
                getDataInSocket(message);
              }
            } catch (e) {
              log(e.toString());
              box.put("workNot", "1");
            }
          },
        );
        box.put("listenServer", "1");
      } catch (e) {
        box.put("listenServer", "0");
        box.put("workNot", "1");
      }
    } catch (e) {
      log("listenServer");

      log(e.toString());
    }
  }

  Future getDataInSocket(String data) async {
    try {
      try {
        var model = ModelSocketMessage.fromJson(jsonDecode(data));
        await showNotification(model.id.toString(), model.title.toString(),
            model.summary.toString());
      } catch (e) {
        log("hive saqlash");
        log(e.toString());
      }
    } catch (e) {
      log("getDataInSocket");
      dataParseList =
          (data as List).map((e) => ModelSocketMessage.fromJson(e)).toList();

      log(e.toString());
    }
  }

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
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

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        try {
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => MainMessages(),
          ));
          // switch (notificationResponse.notificationResponseType) {
          //   case NotificationResponseType.selectedNotification:
          //     await Hive.initFlutter();
          //     await Hive.openBox('online');
          //     final box = Hive.box("online");
          //     box.put("windowNews", "1");
          //
          //     break;
          //   case NotificationResponseType.selectedNotificationAction:
          //     await Hive.initFlutter();
          //     await Hive.openBox('online');
          //     final box = Hive.box("online");
          //     box.put("windowNews", "1");
          //     break;
          // }
          //
          // await Hive.initFlutter();
          // await Hive.openBox('online');
          // final box = Hive.box("online");
          // box.put("windowNews", "1");
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  @pragma('vm:entry-point')
  static notificationTapBackground(
      NotificationResponse notificationResponse) async {
    try {
      await Hive.initFlutter();
      await Hive.openBox('online');
      final box = Hive.box("online");
      box.put("windowNews", "1");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> showNotification(String id, String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '100',
      'BMBA',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: DarwinNotificationDetails(
            presentBadge: true,
            presentAlert: true,
            subtitle: "ios",
            presentBanner: true));

    await _flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);

    await Hive.initFlutter();
    await Hive.openBox('online');
    final box = Hive.box("online");

    try {
      final wsUrl = Uri.parse("wss://uzbmb.uz/websockets");
      final channel = WebSocketChannel.connect(wsUrl);
      await channel.ready;
      channel.stream.listen(
        (message) {
          channel.sink.add(
              "{\"action\": \"stop\", \"data\": \"${(box.get("imie")).toString()}\", \"id\":\"$id\" }");
        },
      );
    } catch (e) {}
  }

  static Future<void> onSelectNotification(String? payload) async {
    try {
      await Hive.initFlutter();
      await Hive.openBox('online');
      final box = Hive.box("online");
      box.put("windowNews", "1");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> getImie() async {
    try {
      await Hive.initFlutter();
      await Hive.openBox("online");
      final box = Hive.box("online");
      return box.get("imie").toString();
    } catch (e) {
      log(e.toString());
      return "";
    }
  }

  Future<String> getInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('dtm.uz');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return 'connected';
      } else {
        return " ";
      }
    } catch (e) {
      return " ";
    }
  }
}

void onDidReceiveLocalNotification() async {
// display a dialog with the notification details, tap ok to go to another page
}

class ModelSocketMessage {
  int id;
  String pnfl;
  String title;
  String summary;
  dynamic sendDate;
  bool status;

  ModelSocketMessage({
    required this.id,
    required this.pnfl,
    required this.title,
    required this.summary,
    required this.sendDate,
    required this.status,
  });

  factory ModelSocketMessage.fromJson(Map<String, dynamic> json) =>
      ModelSocketMessage(
        id: json["id"],
        pnfl: json["pnfl"],
        title: json["title"],
        summary: json["summary"],
        sendDate: json["send_date"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pnfl": pnfl,
        "title": title,
        "summary": summary,
        "send_date": sendDate,
        "status": status,
      };
}

class MadelDataBack {
  String status;

  MadelDataBack({
    required this.status,
  });

  factory MadelDataBack.fromJson(Map<String, dynamic> json) => MadelDataBack(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
