import Foundation
import Flutter
import UIKit

public class SwiftAutofillHelperPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "autofill_helper", binaryMessenger: registrar.messenger())
    let instance = SwiftAutofillHelperPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "saveCredentials" {
      guard let args = call.arguments else {
        result(FlutterError(code: "-1", message: "No arguments supplied", details: "none"))
        return
      }
        
      if let argsMap = args as? [String: Any],
        let fqdn = argsMap["fqdn"] as? String,
        let username = argsMap["username"] as? String,
        let password = argsMap["password"] as? String {
        SecAddSharedWebCredential(
          fqdn as CFString,
          username as CFString,
          password as CFString,
          {(error: CFError!) -> Void in 
            if error != nil {
              result(FlutterError(code: "-1", message: "Some arguments not supplied", details: "none"))
              return
            } else {
              result(true)
              return
            }
          }
        )
      } else {
        result(FlutterError(code: "-1", message: "Some arguments not supplied", details: "none"))
        return
      }

      result(FlutterError(code: "-1", message: "Unknown error", details: "none"))
      return
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
