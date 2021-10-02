//
//  ViewController.swift
//  UIViewControllerXib
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let homeVC = HomeViewController()
        
        self.navigationController?.pushViewController(homeVC, animated: true)
        
        
    }


}

//如果源文件与xib文件名字相同,实例化将十分简单let homeVC = HomeViewController()
//系统会在init时判断是否有与之同名的xib文件,如果有就会加载并实例化
//init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)方法要指定xib文件才可以使用,虽然实例化homeVC时使用的是HomeViewController()
//但是init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)方法还是会被系统调用,所以无需手动调用
//如果VC有自己的初始化方法,那么就要在该方法中调用init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?),但是该类不用去实现这个方法
