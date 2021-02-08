//
//  HomeViewController.swift
//  UIViewControllerXib
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var btn: UIButton!
    
    override func loadView() {
        super.loadView()
        //设置插座变量要在这里,而不是在实例化后就设置那时候还没有加载视图层次结构
        btn.setTitle("xxxx", for: .normal)
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        print("viewDidLoad")
    }

    //必须加上这个方法,否则添加的那个按钮显示不出来
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "HomeViewController", bundle: nil)
        //这里需要传入xib的名字,如果创建源文件时一起创建了xib,那么填写的就是HomeViewController,如果xib是后面进行创建和关联的,那么填写xib的名字
        print("initnibName")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }
    
    //避免编译器报错
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
