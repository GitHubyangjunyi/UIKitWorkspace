//
//  ClosureViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/15.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toSubView(_ sender: UIButton) {
        let subVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ClosureSubViewController") as! ClosureSubViewController
        subVC.text = self.valueTextField.text!
        subVC.valueClosure = { [unowned self] (value: String) in
            self.valueTextField.text = value
        }
        navigationController?.pushViewController(subVC, animated: false)
    }
    
}
