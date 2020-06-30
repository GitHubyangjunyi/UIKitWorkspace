//
//  ViewController.swift
//  UITableViewStoryboardStaticCell
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }


}

//静态Cell只能在UITableViewController中使用
//将TableView的Content设置为Static Cells并设置Cell的Style为Basic

//UITableViewController是可以与源文件进行关联的,但是静态的Cell不可以而只能是UITableViewCell类型,即使在ID检查器中将Cell的Custom Class设置为自定义的类型也是没用的
