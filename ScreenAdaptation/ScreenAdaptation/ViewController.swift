//
//  ViewController.swift
//  ScreenAdaptation
//
//  Created by 杨俊艺 on 2020/11/4.
//

import UIKit

//#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
//#define KScreenWidth ([UIScreen mainScreen].bounds.size.width)
//#define SafeAreaTopHeight (KScreenHeight >= 812.0 ? 88 : 64)
//#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
//
////判断iPhoneX，Xs（iPhoneX，iPhoneXs）
//#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size): NO)
////判断iPhoneXr
//#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size)  : NO)
////判断iPhoneXsMax
//#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size): NO)
//
////判断iPhoneX所有系列
//#define IS_IPhoneXAll (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max)
//#define k_Height_NavBar (IS_IPhoneXAll ? 88.0 : 64.0)
//#define k_Height_TabBar (IS_IPhoneXAll ? 83.0 : 49.0)
/////底部安全视图高度
//#define k_bottom_SafeH (IS_IPhoneXAll ? 34 : 0)



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = UIApplication.shared.statusBarFrame
        
    
        
        
        
        
        
        
    }


}

