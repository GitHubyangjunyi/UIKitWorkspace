//
//  NKVOSubViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/15.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class NKVOSubViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    @objc dynamic var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.text = text
        
        //自定义返回按钮的触发动作确保返回时传递数据回去
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(back(_:)))
    }
    
    @IBAction func back(_ sender: UIButton) {
        text = valueTextField.text!
        navigationController?.popViewController(animated: true)
    }
}
