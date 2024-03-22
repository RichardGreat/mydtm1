//
//  Notification.swift
//  Runner
//
//  Created by macbookpro on 09/03/24.
//
import Flutter
import Foundation

class RemoteNotification {
    private static let tokenKey = "device_token"
    private static let notificationKey = "notification_info_key"
    private static let notificationTapped = "notification_tapped"
    private static let clearNotificationInfo = "clear_notification_info"
    private static let basicMethodChannelName = "uzbmba-remote-notification"
    
    private static var basicMessageChannel: FlutterBasicMessageChannel?
    
    static func register(with binaryMessenger: FlutterBinaryMessenger) {
        basicMessageChannel = FlutterBasicMessageChannel(name: basicMethodChannelName,
                                                         binaryMessenger: binaryMessenger,
                                                         codec: FlutterStringCodec.sharedInstance())
        
        basicMessageChannel?.setMessageHandler { actionType, reply in
            
            if let actionType = actionType as? String {
                
                switch (actionType) {
                case tokenKey:
                    let deviceToken: String? = getDeviceToken()
                    reply(deviceToken)
                case notificationKey:
                    let json: String? = getNotificationInfo()
                    reply(json)
                case clearNotificationInfo:
                    cleraNotificationInfo()
                    reply(nil)
                default:
                    reply(FlutterMethodNotImplemented)
                }
            } else {
                reply(FlutterMethodNotImplemented)
            }
        }
    }
    
    static func save(device token: String) {
        UserDefaults.standard.setValue(token, forKey: tokenKey)
    }
    
    static func save(request: UNNotificationRequest) {
        guard let userInfo = (request.content.mutableCopy() as? UNMutableNotificationContent)?.userInfo else {
            debugPrint("no notification data")
            return
        }
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            let encodable = userInfo.toStringDictionary()
            debugPrint("Notification didReceive \(encodable)")
            let data = try encoder.encode(encodable)
            let json = String(data: data, encoding: .utf8)
            UserDefaults.standard.setValue(json, forKey: notificationKey)
            basicMessageChannel?.sendMessage(notificationTapped)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private static func getDeviceToken() -> String? {
        let deviceToken = UserDefaults.standard.string(forKey: tokenKey)
        return deviceToken
    }
    
    private static func getNotificationInfo() -> String? {
        let json = UserDefaults.standard.string(forKey: notificationKey)
        return json
    }
    
    private static func cleraNotificationInfo() {
        UserDefaults.standard.setValue(nil, forKey: notificationKey)
    }
}


extension Dictionary where Key == AnyHashable, Value == Any {
    func toStringDictionary() -> [String: String] {
        var dictionary = [String: String]()
        for e in self {
            dictionary[e.key.description] = "\(e.value)"
        }
        return dictionary
    }
}
