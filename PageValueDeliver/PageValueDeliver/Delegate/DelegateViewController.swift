//
//  DelegateViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/12.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit


class DelegateViewController: UIViewController, ValueBack {

    @IBOutlet weak var valueTextField: UITextField!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toSubView(_ sender: UIButton) {
        let subVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DelegateSubViewController") as! DelegateSubViewController
        subVC.text = self.valueTextField.text!
        subVC.delegate = self
        navigationController?.pushViewController(subVC, animated: false)
    }
    
    func valueBack(value: String) {
        self.valueTextField.text = value
    }

}
