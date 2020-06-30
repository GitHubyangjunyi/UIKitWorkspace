//
//  ViewController.swift
//  XibCustomViewWithOutletsAndActions
//
//  Created by 杨俊艺 on 2020/6/30.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var customView: CustomView!

    override func loadView() {
        super.loadView()

        let customView = CustomView()
        self.view.addSubview(customView)
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: self.view.topAnchor),
            customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.customView = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customView.textLabel.text = "Lorem ipsum"
    }
}

//现在有了一个可以正常工作的自定义UIView对象该对象可以加载xib文件以使用其内容
