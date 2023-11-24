
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> initialNotification() async {
//     AndroidInitializationSettings androidInitializationSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     var initializationSettingsIos = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         requestCriticalPermission: true,
//         requestProvisionalPermission: true,
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {
//           log("id");
//           log(title.toString());
//           log("id");
//         });
//
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: initializationSettingsIos,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {
//
//       },
//     );
//   }
//
//   void onDidReceiveNotificationResponse1(
//       NotificationResponse notificationResponse) async {
//     print(notificationResponse.payload);
//   }
//
//   notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max, priority: Priority.high),
//         iOS: DarwinNotificationDetails());
//   }
//
//   Future showNotification(
//       {int id = 0,
//       String title = "Sobir",
//       String? body,
//       String? payLoad}) async {
//     return flutterLocalNotificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
//
//   Future onSelectNotification(String payload, BuildContext context) async {
//
//     Navigator.push(
//         context,
//         CupertinoPageRoute(
//           builder:
//               (context) =>
//                   CertificateView(linkCert: "https://uzbmb.uz/")
//         ));
//
//   }
//
// // void sendNotification() async {
// //   AndroidNotificationDetails androidNotificationChannel =
// //   const AndroidNotificationDetails("channelId", "channelName",
// //       importance: Importance.max, priority: Priority.max);
// // }
// //   NotificationDetails notificationDetails =
// //       NotificationDetails(android: androidNotificationChannel);
// //
// //   await flutterLocalNotificationsPlugin.show(
// //       0, "title", "body", notificationDetails);
// // }
// }
