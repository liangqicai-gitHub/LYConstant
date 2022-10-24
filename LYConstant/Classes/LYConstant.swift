//
//  LYConstant.swift
//  LYAppKit
//
//  Created by 孙宁宁 on 2022/9/21.
//

import KeychainSwift
import Foundation

public class LYConstant: NSObject {

    //MARK:-
    public static let screenSize: CGSize = {
        let s = UIScreen.main.bounds.size
        return CGSize(width: min(s.width, s.height), height: max(s.width, s.height))
    }()
    
    public static let screenWidth: CGFloat = {
        return screenSize.width
    }()
    
    public static let screenHeight: CGFloat = {
        return screenSize.height
    }()
    
    public static let onepix: CGFloat = { return 1.0 / UIScreen.main.scale }()
    
    //MARK:-
    public static let documentRootPath =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    public static let temRootPath = NSTemporaryDirectory()
    
    //MARK:-
    public static var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return keyWindow?.safeAreaInsets ?? .zero
        } else {
            return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
    
    public static var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }

    //MARK: -
    public static var diyDeviceId: String {
        let keychainKey = "lyconstant.diyDeviceId"
        let keychain = KeychainSwift()
        guard let diyDeviceId = keychain.get(keychainKey), diyDeviceId.count > 0 else {
            let uuid = UIDevice.current.identifierForVendor ?? UUID()
            let uuidString = uuid.uuidString
            keychain.set(uuidString, forKey: keychainKey)
            return uuidString
        }
        return diyDeviceId
    }
    
    //比如说：梁齐才的iphone
    public static var deviceName: String {UIDevice.current.systemName}
    //OS系统名称 如：iOS
    public static var systemName: String {UIDevice.current.systemName}
    //OS系统版本号 系统版本，如：14.6
    public static var systemVersion: String {UIDevice.current.systemVersion}
    //设备区域化型号，如：A1533
    public static var deviceLocalizedModelModel: String {UIDevice.current.localizedModel}
    // 设备型号，具体是什么手机。如:iPhone 11 Pro, ipad
    public static var deviceModel: String {UIDevice.current.model}
    
    // MARK: -
    public static var infoPlist: [String : Any] { Bundle.main.infoDictionary ?? [:] }
    public static var bundleId: String { Bundle.main.bundleIdentifier ?? "" }
    public static var appStoreVersion: String { infoPlist["CFBundleShortVersionString"] as! String } // 用户能看到的版本号
    public static var buildVersion: String { infoPlist["CFBundleVersion"] as! String }
    
}
