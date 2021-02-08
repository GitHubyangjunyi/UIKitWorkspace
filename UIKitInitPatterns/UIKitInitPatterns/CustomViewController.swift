//
//  CustomViewController.swift
//  UIKitInitPatterns
//
//  Created by 杨俊艺 on 2020/6/30.
//

import UIKit

class CustomViewController: UIViewController {

    //外部xib初始化需要重写这个方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initialize()
    }
    
    //Storyboard初始化需要重写这个方法
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialize()
    }
    
    //代码初始化
    init() {
        super.init(nibName: nil, bundle: nil)
        self.initialize()
    }
    
    func initialize() {
        //自定义的初始化
        self.view.backgroundColor = UIColor.red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//还可以从以后的子类中隐藏init（nib，bundle）和init（coder）方法
//不必重写init（nib，bundle）并且可以将init（coder）标记为便利初始化程序
class MyViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.initialize()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)

        self.initialize()
    }

    func initialize() {
        //自定义的初始化
    }
}

class MyFutureViewController: MyViewController {

    override init() {
        super.init()
    }
}
let vc = MyFutureViewController()
