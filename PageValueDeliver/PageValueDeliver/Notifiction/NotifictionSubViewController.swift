//
//  NotifictionSubViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/18.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class NotifictionSubViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.valueTextField.text = self.text
        
        //自定义返回按钮的触发动作确保返回时传递数据回去
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(back(_:)))
    }
    
    @IBAction func back(_ sender: UIButton) {
        //发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ValueBack"), object: nil, userInfo: ["value" : valueTextField.text!])
        navigationController?.popViewController(animated: true)
    }

}
