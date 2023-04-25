import UIKit
import Flutter
import TPDirect

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    TPDSetup.setWithAppId(12348, withAppKey: "app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF", with: .sandBox)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let messageChannel = FlutterMethodChannel(name: "tappay",
                                              binaryMessenger: controller.binaryMessenger)
        messageChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // This method is invoked on the UI thread.
      // Handle battery messages.
        guard call.method == "getTapPayToken", let paymentParams = call.arguments as? Dictionary<String, Any> else {
          result(FlutterMethodNotImplemented)
          return
        }
        if let cardNumber = paymentParams["cardNumber"] as? String,
           let dueYear = paymentParams["dueYear"] as? String,
           let dueMonth = paymentParams["dueMonth"] as? String,
           let cvv = paymentParams["cvv"] as? String {
            let card = TPDCard.setWithCardNumber(cardNumber, withDueMonth: dueMonth, withDueYear: dueYear, withCCV: cvv)
//            TPDCard.
//            TPDServer.createToken(withCard: card) { (result, error) in
//                   if let error = error {
//                       result(FlutterError(code: "TOKEN_ERROR", message: error.localizedDescription, details: nil))
//                   } else if let token = result?.identifier {
//                       result(token)
//                   } else {
//                       result(FlutterError(code: "TOKEN_ERROR", message: "Unknown error occurred while creating token", details: nil))
//                   }
//               }
//            let result = TPDCard.validate(withCardNumber: cardNumber, withDueMonth: dueMonth, withDueYear: dueYear, withCCV: cvv)
//            switch result {
//            case .some(let result):
//
//            default: break
//            }
            

        }
//        self?.receiveBatteryLevel(result: result)
    })
        
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
}
