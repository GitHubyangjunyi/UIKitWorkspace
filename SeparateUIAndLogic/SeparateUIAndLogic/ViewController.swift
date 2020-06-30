//
//  ViewController.swift
//  SeparateUIAndLogic
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logicBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func processLogic(_ sender: UIButton) {
        print("业务逻辑处理")
    }
    
}

//xib可以同时与UIView子类和UIViewController子类进行关联,同时与两者的实例进行@IBOutlet和@IBAction连线
//例如有一个TestController.swift源文件与TestController.xib文件关联,在TestController.xib中有个View,该View与TestView.swift源文件关联
//同时该View的File's Owner与TestController.swift源文件关联
//这样该View就既与UIView子类关联又与UIViewController子类关联
//如果该View上有个Button,那么这个Button既可以与TestController.swift进行连线处理业务逻辑,又可以与TestView.swift连线处理UI更新
