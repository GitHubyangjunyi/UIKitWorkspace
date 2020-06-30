//
//  ViewController.swift
//  XibDALFactory
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalToolBar = ToolBar.toolBar(type: .normal)
        normalToolBar?.frame.origin = CGPoint.init(x: 0, y: 100)
        view.addSubview(normalToolBar!)
        
        
        let editToolBar = ToolBar.toolBar(type: .edit)
        editToolBar?.frame.origin = CGPoint.init(x: 0, y: 200)
        view.addSubview(editToolBar!)
        
    }


}

//使用Bundle实例化xib进行使用
//let view = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?[0] as! UIView
//let view = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?[1] as! UIView
//当xib中存在多个View时,这些View的自定义Class必须是不同的
//通常都是在xib中添加一个View然后固定去取第一个元素进行使用,但是可以添加多个View并于不同的源文件进行关联
//并将Bundle的func loadNibNamed(_ name: String, owner: Any?, options: [UINib.OptionsKey : Any]? = nil) -> [Any]?封装到源文件的一个类方法中
//源文件派生子类并分局不同的情况返回不同的子类,实现类工厂
