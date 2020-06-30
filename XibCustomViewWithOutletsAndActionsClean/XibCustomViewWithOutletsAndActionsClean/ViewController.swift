//
//  ViewController.swift
//  XibCustomViewWithOutletsAndActionsClean
//
//  Created by 杨俊艺 on 2020/6/30.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.textLabel.text = "XXXX"
    }


}


