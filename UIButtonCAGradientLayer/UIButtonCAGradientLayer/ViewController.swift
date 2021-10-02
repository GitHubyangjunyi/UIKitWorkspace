//
//  ViewController.swift
//  UIButtonCAGradientLayer
//
//  Created by 杨俊艺 on 2021/9/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = CAGButton.init(type: .custom)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        btn.backgroundColor = .red
        
        let cal = btn.layer as? CAGradientLayer
        cal?.colors = [UIColor.red, UIColor.blue].map { $0.cgColor }
        
        btn.setTitle("发顺丰速度", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        
        
        view.addSubview(btn)
        
        
        
        
    }


}

class CAGButton: UIButton {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
//    override init(frame: CGRect) {
//        // 可以在这里重新操作CAGradientLayer生成的layer
//    }
}
