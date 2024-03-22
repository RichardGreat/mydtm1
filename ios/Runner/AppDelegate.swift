import UIKit
import Flutter
import UserNotifications


//import flutter_background_service_ios

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        GeneratedPluginRegistrant.register(with: self)
        
        configurePushNotification()
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func configurePushNotification() {
        let controller = window?.rootViewController as! FlutterViewController
        RemoteNotification.register(with: controller as! FlutterBinaryMessenger)
        UNUserNotificationCenter.current().delegate = self
    
        UIApplication.shared.registerForRemoteNotifications()
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        saveData(data: authorizationOptionsToString(authOptions))  // <- saqlash
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, error) in
            guard error == nil else {
                debugPrint(error!.localizedDescription)
                return
            }
        }
    }

     func saveData( data : String){
            let preferences = UserDefaults.standard
            let currentLevelKey = "currentLevel"
            let currentLevel = data
            preferences.set(currentLevel, forKey: currentLevelKey)
            let didSave = preferences.synchronize()
            print(data)
            if !didSave {
                print("Couldn't save (I've never seen this happen in real world testing)")
            }
        }
    
    
    func authorizationOptionsToString(_ options: UNAuthorizationOptions) -> String {
        return String(describing: options.rawValue)
    }
    func stringToAuthorizationOptions(_ string: String) -> UNAuthorizationOptions? {
        if let rawValue = UInt(string) {
            return UNAuthorizationOptions(rawValue: rawValue)
        } else {
            return nil
        }
    }
    
    

    
    // read
    func readData() -> UNAuthorizationOptions?{
        let defaults = UserDefaults.standard
        if let authOptions = defaults.string(forKey: "currentLevel"){
                print("authOptions: \(authOptions)")
           return  stringToAuthorizationOptions(authOptions)
            } else {
                print("No data found in UserDefaults")
                return nil
            }
        
       
    }
    
    

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        let userInfo = response.notification.request.content.userInfo
//        if let notificationText = userInfo["your_text_key"] as? String:String
       print("###123")
        print(userInfo)
        
        completionHandler([.alert, .sound, .badge])
    }

    
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }

        let token = tokenParts.joined()
        RemoteNotification.save(device: token)
        debugPrint("Divice Token:", token)
        super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let platformChannel = FlutterMethodChannel(name: "uzbNotification", binaryMessenger: controller.binaryMessenger)
          platformChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "mChannel" {
              result(token)
            } else {
              result(FlutterMethodNotImplemented)
            }
          })
        
      
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchComletionHandler completionHandler: @escaping(UIBackgroundFetchResult) -> Void)  {
        
        guard let aps = userInfo["aps"] as? [String: Any] else {
            completionHandler(.failed)
            return
        }
        completionHandler(.newData)
    }
    
//    override func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                         didReceive response: UNNotificationResponse,
//                                         withCompletionHandler completionHandler: @escaping () -> Void) {
//
//        completionHandler()
//                print("completionHandler() ###")
//                print(completionHandler())
//    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         willPresent notification: UNNotification,
                                         withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    override func application(_ application: UIApplication,
                              performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(.newData)
    }
    
    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint("Error registration notification:\(error)")
    }
}

