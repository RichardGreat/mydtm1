import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

//    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
//           GeneratedPluginRegistrant.register(with: registry)
//       }

     let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
     let backgroundServiceChannel = FlutterMethodChannel(name: "my_channel_name", binaryMessenger: controller.binaryMessenger)

        backgroundServiceChannel.setMethodCallHandler { [weak self] (call, result) in
          if call.method == "setForegroundMode" {
            // Implement your background service logic here for iOS
            // For example, start a background task
            // ...
            result(nil)
          } else {
            result(FlutterMethodNotImplemented)
          }
        }

    if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)

//       if #available(iOS 10.0, *) {
//         UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
//       }


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
