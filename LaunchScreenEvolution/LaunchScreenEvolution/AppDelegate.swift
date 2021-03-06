//
//  AppDelegate.swift
//  LaunchScreenEvolution
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var launchWindow: UIWindow? //启动页
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("完成启动开始加载启动页")
        
        launchWindow = UIWindow.init(frame: UIScreen.main.bounds)
        launchWindow?.rootViewController = UIStoryboard.init(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
        launchWindow?.windowLevel = .normal + 1
        launchWindow?.isHidden = false
        
        
        UIView.animate(withDuration: 1, delay: 3, options: .curveEaseOut, animations: {
            self.launchWindow?.alpha = 0.0
        }) { (finish) in
            if finish {
                self.launchWindow?.isHidden = true
                self.launchWindow?.windowLevel = .normal - 1
                self.launchWindow?.alpha = 1.0
            }
        }
        
        window = UIWindow.init()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        return true
    }


}

