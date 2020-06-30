//
//  ViewController.swift
//  FrameBounds
//
//  Created by 杨俊艺 on 2020/6/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let redView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 250, height: 250))
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        
        
        let blackView = UIView.init(frame: CGRect.init(x: 50, y: 50, width: 150, height: 150))
        blackView.backgroundColor = UIColor.black
        redView.addSubview(blackView)
        
        let buleView = UIView.init(frame: CGRect.init(x: 35, y: 35, width: 80, height: 80))
        buleView.backgroundColor = UIColor.blue
        blackView.addSubview(buleView)
        
        self.view.bounds = CGRect.init(x: 50, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
    }


}

