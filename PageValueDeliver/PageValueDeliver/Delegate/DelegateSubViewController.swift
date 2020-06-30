//
//  DelegateSubViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/12.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

protocol ValueBack: NSObjectProtocol {
    func valueBack(value: String)
}

class DelegateSubViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    var text = ""
    weak var delegate: ValueBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.valueTextField.text = self.text
        
        //自定义返回按钮的触发动作确保返回时传递数据回去
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(back(_:)))
    }

    @IBAction func back(_ sender: UIButton) {
        delegate?.valueBack(value: self.valueTextField.text!)
        navigationController?.popViewController(animated: true)
    }
    
}
