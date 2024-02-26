import UIKit
import Flutter
import flutter_background_service_ios


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
//   var socket: WebSocket?
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
//           GeneratedPluginRegistrant.register(with: registry)
//       }
     let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
     let backgroundServiceChannel =
      FlutterMethodChannel(name: "my_channel_bba", binaryMessenger: controller.binaryMessenger)

        backgroundServiceChannel.setMethodCallHandler { [weak self] (call, result) in
          if call.method == "setForegroundMode" {
            // background service logic
            // background task
            // ...
//                 UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(5))
            result(nil)
          } else {
            result(FlutterMethodNotImplemented)
          }
        }
    if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
//         return true
//         let url = URL(string: "wss://uzbmb.uz/websockets")!
//         socket = WebSocket(url: url)
//         socket?.delegate = self
//         socket?.connect()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

//   func performBackgroundTask(completionHandler: @escaping (Bool) -> Void) {
//           // Your background task logic goes here
//
//           // For example, send a message to the Flutter app using the WebSocket
//           if let socket = socket {
//               socket.write(string: "Background task triggered")
//           }
//
//           // Simulate background work
//           DispatchQueue.global().async {
//               // Simulate time-consuming task
//               Thread.sleep(forTimeInterval: 5)
//
//               // Show a notification
//               self.showNotification()
//
//               // Notify Flutter that the background task is complete
//               DispatchQueue.main.async {
//                   completionHandler(true)
//               }
//           }
//       }
//
//       func showNotification() {
//           // Your notification creation logic goes here
//           let content = UNMutableNotificationContent()
//           content.title = "Background Task Completed"
//           content.body = "Your background task has finished."
//
//           let request = UNNotificationRequest(identifier: "backgroundTask", content: content, trigger: nil)
//
//           UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//       }
//   }
//
//   // WebSocket delegate methods
//   extension AppDelegate: WebSocketDelegate {
//       func didReceive(event: WebSocketEvent, client: WebSocket) {
//           switch event {
//           case .connected(let headers):
//               print("WebSocket is connected with headers: \(headers)")
//           case .disconnected(let reason, let code):
//               print("WebSocket is disconnected with reason: \(reason), code: \(code)")
//           case .text(let string):
//               print("WebSocket received text: \(string)")
//               // Handle incoming WebSocket messages
//           default:
//               break
//           }
//       }
//   }

}
