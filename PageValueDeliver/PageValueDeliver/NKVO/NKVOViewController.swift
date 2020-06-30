//
//  NKVOViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/15.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class NKVOViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NKVOViewController" {
            let subVC = segue.destination as! NKVOSubViewController
            subVC.text = valueTextField.text!
            observation = subVC.observe(\.text) {[unowned self] (subVC, changed) in
                self.valueTextField.text = subVC.text
                self.observation = nil
            }
        }
    }

}
