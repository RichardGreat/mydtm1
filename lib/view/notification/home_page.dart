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
    await Hive.openBox("online2");
    var box = Hive.box("online2");
    box.put("workNot", "1");

    Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        log("timer");
        log(box.get("workNot").toString());
        log((await getInternetConnection()));

        if (((await getInternetConnection()) == "connected") &&
                box.get("workNot").toString() == "1" ||
            box.get("workNot").toString() == "null") {
          listenServer();
          box.put("workNot", "0");
        }
      } catch (e) {
        box.put("workNot", "1");
      }
    });
  }

  Future listenServer() async {
    try {
      await Hive.initFlutter();
      await Hive.openBox("online");
      final box = Hive.box("online");
      await Hive.openBox("online2");
      final box2 = Hive.box("online2");
      log(box.get("imie").toString());
      try {
        if (box.get("imie").toString().length > 12) {
          final wsUrl = Uri.parse("wss://uzbmb.uz/websockets");
          final channel = WebSocketChannel.connect(wsUrl);
          await channel.ready;
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
                box2.put("workNot", "1");
              }
            },
          );
        }
      } catch (e) {
        box2.put("workNot", "1");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getDataInSocket(String data) async {
    try {
      try {
        var model = ModelSocketMessage.fromJson(jsonDecode(data));
        await showNotification(model.id.toString(), model.title.toString(),
            model.summary.toString(),
             model.sendDate.toString()
        );
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
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        try {
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => MainMessages(),
          ));
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
      await Hive.openBox('online2');
      final box = Hive.box("online2");
      box.put("windowNews", "1");
    } catch (e) {
      log(e.toString());
    }
  }

  List<ModelSocketMessage> listModelSocket = [];

  Future<void> showNotification(String id, String title, String body, String sendDate) async {
    await Hive.initFlutter();
    await Hive.openBox('online2');
    final box2 = Hive.box("online2");
    box2.put("windowNews", "1");

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

    try {
      log("birinchi");
      if (box2.get("bildirishnoma").toString().length > 5) {
        listModelSocket = (jsonDecode(box2.get("bildirishnoma")) as List)
            .map((e) => ModelSocketMessage.fromJson(e))
            .toList();
        listModelSocket.add(ModelSocketMessage(
          title: title.toString(),
          id: id.toString(),
          summary: body,
          pnfl: "",
          status: "",
          sendDate: sendDate,
        ));
        box2.put("bildirishnoma", (jsonEncode(listModelSocket)).toString());
        log("ma'lumot saqlandi 123");
      }else {
        log("ikkinchi");
        listModelSocket.add(ModelSocketMessage(
          title: title.toString(),
          id: id.toString(),
          summary: body.toString(),
          pnfl: "",
          status: "",
          sendDate: sendDate.toString(),
        ));
        box2.put("bildirishnoma", (jsonEncode(listModelSocket)).toString());
        log("uchunchi");
      }
    } catch (e) {
      log("e.toString()");
      log(e.toString());
      listModelSocket.add(ModelSocketMessage(
        title: title.toString(),
        id: id.toString(),
        summary: body,
        pnfl: "",
        status: "",
        sendDate: "",
      ));

      log("ma'lumot 567");
      box2.put("bildirishnoma", (jsonEncode(listModelSocket)).toString());
      log("ma'lumot saqlandi");
    }
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);

    await Hive.initFlutter();
    await Hive.openBox("online");
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
      await Hive.openBox('online2');
      final box2 = Hive.box("online2");
      box2.put("windowNews", "1");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> getImie() async {
    try {
      await Hive.initFlutter();
      await Hive.openBox("online2");
      final box = Hive.box("online2");
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
  dynamic id;
  dynamic pnfl;
  dynamic title;
  dynamic summary;
  dynamic sendDate;
  dynamic status;

  ModelSocketMessage({
    this.id,
    this.pnfl,
    this.title,
    this.summary,
    this.sendDate,
    this.status,
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
