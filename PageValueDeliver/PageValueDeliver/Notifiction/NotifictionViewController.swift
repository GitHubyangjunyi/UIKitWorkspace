//
//  NotifictionViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/18.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class NotifictionViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //监听通知
        NotificationCenter.default.addObserver(self, selector: #selector(getValue(notifiction:)), name: NSNotification.Name(rawValue: "ValueBack"), object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NotifictionViewController" {
            let subVC = segue.destination as! NotifictionSubViewController
            subVC.text = valueTextField.text!
        }
    }
    
    @objc func getValue(notifiction: Notification) {
        valueTextField.text = (notifiction.userInfo!["value"]! as! String)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
