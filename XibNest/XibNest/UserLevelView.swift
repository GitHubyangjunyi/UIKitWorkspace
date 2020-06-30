//
//  UserLevelView.swift
//  XibNest
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class UserLevelView: UIView {

    @IBOutlet var label: UILabel!
    //使用强引用来防止赋值之后就被释放导致crash
    //1.序列化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    //2.唤醒
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = "Xib"
    }
    //3.依据frame绘制
    override init(frame: CGRect) {
        super.init(frame: frame)
        if label == nil {
            //如果label为nil就说明不是使用xib进行加载的,需要使用代码布局
            label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 40))
            label.text = "代码"
            self.addSubview(label)
        }
    }
}

//如果使用xib方式加载调用顺序是
//required init?(coder: NSCoder)
//override func awakeFromNib()
//
//
//如果使用代码方式使用则调用顺序是
//override init(frame: CGRect)
