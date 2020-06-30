//
//  KVOViewController.swift
//  PageValueDeliver
//
//  Created by 杨俊艺 on 2020/6/15.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class KVOViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    var subVC: KVOSubViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        subVC = (segue.destination as! KVOSubViewController)
        subVC!.text = self.valueTextField.text!
        
        //观察text属性变化
        subVC!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    //对观察到的变更进行响应
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            self.valueTextField.text = (object as! KVOSubViewController).text
        }
    }
    
    //移除观察者
    deinit {
        subVC?.removeObserver(self, forKeyPath: "text")
    }
    
}
