import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let controller = self.window?.rootViewController as? FlutterViewController {
            let batteryChannel = FlutterMethodChannel(
                name: "samples.flutter.dev/battery",
                binaryMessenger: controller.binaryMessenger
            )
            
            batteryChannel.setMethodCallHandler { [weak self] call, result in
                if call.method == "getBatteryLevel" {
                    if let batteryLevel = self?.getBatteryLevel() {
                        if batteryLevel == -1 {
                            result(FlutterError(
                                code: "UNAVAILABLE",
                                message: "Battery level not available.",
                                details: nil
                            ))
                        } else {
                            result(batteryLevel)
                        }
                    }
                } else {
                    result(FlutterMethodNotImplemented)
                }
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func getBatteryLevel() -> Int {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        if device.batteryState == .unknown {
            return -1
        } else {
            return Int(device.batteryLevel * 100)
        }
    }
}

