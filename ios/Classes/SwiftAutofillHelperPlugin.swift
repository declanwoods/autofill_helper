import Flutter
import UIKit
import Shared

public class SwiftAutofillHelperPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "autofill_helper", binaryMessenger: registrar.messenger())
    let instance = SwiftAutofillHelperPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "saveCredentials" {
      guard let args = call.arguments else {
        result(FlutterError(code: "-1", message: "No arguments supplied"))
        return
      }
        
      if let argsMap = args as? [String: Any],
        let fqdn = argsMap["fqdn"] as? String,
        let username = argsMap["username"] as? String,
        let password = argsMap["password"] as? String {
        SecAddSharedWebCredential(
          fqdn,
          username,
          password,
          (error) {
            if error != nil {
              result(FlutterError(code: "-1", message: "Some arguments not supplied"))
              return
            } else {
              result(true)
              return
            }
          }
        )
      } else {
        result(FlutterError(code: "-1", message: "Some arguments not supplied"))
        return
      }

      result(FlutterError(code: "-1", message: "Unknown error"))
      return
    } else {
      restult(FlutterMethodNotImplemented)
    }
  }
}
