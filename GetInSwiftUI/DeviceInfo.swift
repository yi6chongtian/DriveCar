//
//  DeviceInfo.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/8/2.
//

import Foundation
import UIKit

public struct DeviceInfo {
    
    
    static var scaleX:CGFloat{
        return DeviceInfo.width/375
    }
    
    static var scaleY = height/667
     
    
    
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    //MARK: - 设备尺寸
    public static func UI_IS_IPHONE() -> Bool {
        return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
    }

    public static func SCREENSIZE_IS_35() -> Bool {
        return (UI_IS_IPHONE() && UIScreen.main.bounds.size.height < 568.0)
    }

    public static func SCREENSIZE_IS_40() -> Bool {
        return (UI_IS_IPHONE() && UIScreen.main.bounds.size.height == 568.0)
    }

    public static func SCREENSIZE_IS_47() -> Bool {
        return (UI_IS_IPHONE() && UIScreen.main.bounds.size.height == 667.0)
    }

    public static func SCREENSIZE_IS_55() -> Bool {
        return (UI_IS_IPHONE() && UIScreen.main.bounds.size.height == 736.0)
    }


    //MARK: - 型号判断
    public static var isXR: Bool {
        return (UIScreen.main.currentMode?.size.width == 828 && UIScreen.main.currentMode?.size.height == 1792)
    }

    public static var isX: Bool {
        return (UIScreen.main.currentMode?.size.width == 1125 && UIScreen.main.currentMode?.size.height == 2436)
    }

    public static var isXS: Bool {
        return (UIScreen.main.currentMode?.size.width == 1125 && UIScreen.main.currentMode?.size.height == 2436)
    }

    public static var isMAX: Bool {
        return (UIScreen.main.currentMode?.size.width == 1242 && UIScreen.main.currentMode?.size.height == 2688)
    }

    public static var isFullScreen: Bool {
        
        if safeTopOffset > 20 {
            return true
        }
        
        let screenSize = UIScreen.main.bounds.size
        
        return (screenSize.equalTo(CGSize(width: 375, height: 812)) ||
                screenSize.equalTo(CGSize(width: 812, height: 375)) ||
                screenSize.equalTo(CGSize(width: 414, height: 896)) ||
                screenSize.equalTo(CGSize(width: 896, height: 414)))
    }


    /// 某些机型由于其分辨率未达到官方分辨率，也可能屏幕更换过的原因，导致基于分辨率判断是否全面屏的错误，应该加上尺寸判断
//    public static func IS_FULL_SCREEN() -> Bool {
//        return (SCREENSIZE_IS_XR() ||
//                SCREENSIZE_IS_X() ||
//                SCREENSIZE_IS_XS_MAX() ||
//                SCREENSIZE_IS_FULLSCREEN())
//    }
    
    public static var safeTopOffset: CGFloat {
        
        // 其实也有隐患，如果是从推送打开 App ，可能还不存在 keyWindow
        if #available(iOS 11, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        }
        
        return 20
    }

    public static var safeAreaInsets: UIEdgeInsets {
        get {
            if #available(iOS 11.0, *){
                return UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }  else{
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }


    //MARK: - navigationbar tabbar statusbar 导航栏、标签栏、状态栏
    public static var statusBar_h: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }

    public static var navigationBar_h: CGFloat {
        return statusBar_h + normalNavigationBar_h
    }

    public static var normalNavigationBar_h: CGFloat {
        return 44
    }

    public static var tabBar_h: CGFloat {
        return safeBottom_h + 49
    }

    public static var safeBottom_h: CGFloat {
        return safeAreaInsets.bottom
    }

}
