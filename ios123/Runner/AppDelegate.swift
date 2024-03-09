import UIKit
import Flutter
//import flutter_background_service_ios


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//     let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
//     let backgroundServiceChannel =
//      FlutterMethodChannel(name: "my_channel_bba", binaryMessenger: controller.binaryMessenger)
//
//      
//        backgroundServiceChannel.setMethodCallHandler { [weak self] (call, result) in
//          if call.method == "setForegroundMode" {
// 
////       UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(5))
//            result(nil)
//          } else {
//            result(FlutterMethodNotImplemented)
//          }
//        }
      
    if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}


extension AppDelegate{
    
//    
//   private func getNotificationSettings(){
//       UNUserNotificationCenter.current().getNotificationSettings{
//           (settings) in print("Notification setting:\(settings)")
//           guard settings.authorizationStatus == .authorized else {return}
//           DispatchQueue.main.async{
//               UIApplication.shared.registerForRemoteNotifications()
//           }
//       }
//    }
//    
//  private  func requestNotificationAuthorization(){
//        
//        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) {[weak self] (granted, error)in
//            
//        print("Notification granted:\(granted)")
//            guard granted else{return}
//            self?.getNotificationSettings()
//        }
//    }
    
    
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken:Data) {
        let tokenPart = deviceToken.map{data in String(format:"%02.2hhx", data)}
        let token = tokenPart.joined()
        print("Divice Token:", token)
    }
    
    
    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error registration notification:\(error)")
    }
    
    /* func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchComletionHandler completionHandler:@escaping(UIBackgroundFetchResult) -> Void)  {
    
         guard let aps = userInfo["aps"] as?[String:Any] else{
             completionHandler(.failed)
             
             return
         }
    }*/
}
