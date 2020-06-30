//
//  ViewController.swift
//  XibCustomViewWithOutletsAndActionsCleanExtension
//
//  Created by 杨俊艺 on 2020/6/30.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomView.instantiate()
        customView.textLabel.text = "扩展"
        customView.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        view = customView
        
    }


}

