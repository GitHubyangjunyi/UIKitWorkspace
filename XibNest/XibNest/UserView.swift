//
//  UserView.swift
//  XibNest
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class UserView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        //1.加载xib的方式使用
        let userLevelView = Bundle.main.loadNibNamed("UserLevelView", owner: nil, options: nil)?[0] as! UserLevelView
        //2.代码初始化的方式使用
        //let userLevelView = UserLevelView()
        userLevelView.frame = CGRect.init(x: 260, y: 30, width: 100, height: 40)
        userLevelView.backgroundColor = .gray
        self.addSubview(userLevelView)
    }

}
