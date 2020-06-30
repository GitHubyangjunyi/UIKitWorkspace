//
//  BNRWebViewController.swift
//  UISplitViewController
//
//  Created by 杨俊艺 on 2020/6/3.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import WebKit
import UIKit

class BNRWebViewController: UIViewController, UISplitViewControllerDelegate {
    
    override func loadView() {
        let webView = WKWebView.init()
        self.view = webView
    }
    
    //设备切换到竖屏时
    func splitViewController(_ svc: UISplitViewController, willHide aViewController: UIViewController, with barButtonItem: UIBarButtonItem, for pc: UIPopoverController) {
        barButtonItem.title = "委托提供"
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    //设备切换到横屏时
    func splitViewController(_ svc: UISplitViewController, willShow aViewController: UIViewController, invalidating barButtonItem: UIBarButtonItem) {
        if barButtonItem == self.navigationItem.leftBarButtonItem {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
}
