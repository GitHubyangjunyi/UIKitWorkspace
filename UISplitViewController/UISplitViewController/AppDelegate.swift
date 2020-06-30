//
//  AppDelegate.swift
//  UISplitViewController
//
//  Created by 杨俊艺 on 2020/6/3.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init()
        window?.frame = UIScreen.main.bounds
        //使得window可见makeKeyAndVisiable
        
        let cvc = BNRCourseViewController.init(style: .plain)
        let masterNav = UINavigationController.init(rootViewController: cvc)
        
        let wvc = BNRWebViewController.init()
        cvc.webViewController = wvc
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            //必须将其包含在从导航视图控制器中
            let detailNav = UINavigationController.init(rootViewController: wvc)
            
            let svc = UISplitViewController.init()
            //当设备转动为竖屏时UISplitViewController的委托会收到相应的消息并得到一个特定的UIBarButtonItem对象
            svc.delegate = wvc
            svc.viewControllers = [masterNav, detailNav]
            
            self.window?.rootViewController = svc
        } else {
            window?.rootViewController = masterNav
        }
        
        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}



