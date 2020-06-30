//
//  KVOSubViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/15.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit
//用KVO依然需要是NSObject类或子类，Swift4中swift类不再自动被推测为继承于NSObject，所以当我们在编写swift的代码时，需要为类添加@objcMembers关键字
@objcMembers class KVOSubViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    dynamic var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.valueTextField.text = text
        
        //自定义返回按钮的触发动作确保返回时传递数据回去
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(back(_:)))
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.text = self.valueTextField.text!
        navigationController?.popViewController(animated: true)
    }
    
}
