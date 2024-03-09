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
    private static let basicMethodChannelName = "uzbmba-remote-notification"
    
    private static var basicMessageChannel: FlutterBasicMessageChannel?
    
    static func register(with binaryMessenger: FlutterBinaryMessenger) {
        basicMessageChannel = FlutterBasicMessageChannel(name: basicMethodChannelName,
                                                         binaryMessenger: binaryMessenger,
                                                         codec: FlutterStringCodec.sharedInstance())
        
        basicMessageChannel?.setMessageHandler { actionType, reply in
            
            if let actionType = actionType as? String {
                if (actionType == "device_token") {
                    let deviceToken: String? = getDeviceToken()
                    reply(deviceToken)
                    return
                }
            }
            reply(FlutterMethodNotImplemented)
        }
    }
    
    static func save(device token: String) {
        UserDefaults.standard.setValue(token, forKey: tokenKey)
    }
    
    private static func getDeviceToken() -> String? {
        let deviceToken = UserDefaults.standard.string(forKey: tokenKey)
        return deviceToken
    }
}
