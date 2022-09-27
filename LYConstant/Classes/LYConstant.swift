//
//  LYConstant.swift
//  LYAppKit
//
//  Created by 孙宁宁 on 2022/9/21.
//

import UIKit

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

}
