//
//  ViewController.swift
//  XibNest
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.测试userView使用xib加载
//        
//        let userView = Bundle.main.loadNibNamed("UserView", owner: nil, options: nil)?[0] as! UserView
//        userView.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width - 10, height: 200)
//        userView.backgroundColor = .green
//        self.view.addSubview(userView)
//
        //1.测试userView使用xib加载
        
        //2.测试userView使用不使用xib加载
        let userView = UserView.init()
        userView.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width - 10, height: 200)
        userView.backgroundColor = .green
        self.view.addSubview(userView)
        //2.测试userView使用不使用xib加载
        
        let userLevelView = UserLevelView()
        userLevelView.frame = CGRect.init(x: 10, y: 300, width: 50, height: 50)
        userLevelView.backgroundColor = .red
        self.view.addSubview(userLevelView)
    }


}

//将绿色矩形框封装成一个UserView,并且将红色矩形框封装成另一个UserLevelView
//当用xib布局好UserLevelView和UserView去掉红色矩形框中的元素之后,我们的想法是在UserView.xib中再添加一个View且大小与UserLevelView一样
//然后选中该新添加的View将Class设置为UserLevelView即可,但是这样是无法使用的,在嵌套使用xib时无法通过简单设置View的Class标签完成自动嵌套
//一种解决办法如上所示即在UserView中用代码创建红色矩形UserLevelView
