//
//  CustomView.swift
//  XibCustomViewWithOutletsAndActionsClean
//
//  Created by 杨俊艺 on 2020/6/30.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

class CustomView: View {

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var textLabel: UILabel!

    override func initialize() {
        super.initialize()

        // first: load the view hierarchy to get proper outlets
        UINib(nibName: String(describing: type(of: self)), bundle: .main).instantiate(withOwner: self, options: nil)
        //将self的所有者加载到nib文件中,加载过程完成后将使用xib文件中的适当值填充出口指针
        
        self.addSubview(self.containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

