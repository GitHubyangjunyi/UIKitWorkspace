//
//  ViewController.swift
//  StoryboardModule
//
//  Created by 杨俊艺 on 2020/6/28.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let userVC = UIStoryboard.init(name: "User", bundle: nil).instantiateViewController(withIdentifier: ProfileControllerController.storyboardID())
        //navigationController?.pushViewController(userVC, animated: true)
        
        let settingVC = UIStoryboard.init(name: "User", bundle: nil).instantiateInitialViewController()!
        navigationController?.pushViewController(settingVC, animated: true)
        
    }


}

extension UIViewController {
    class func storyboardID() -> String {
        return String(describing: self)
    }
}

//一个SB文件有多个视图控制器,加载时使用Storyboard ID进行区分,可以在UIViewController中写一个扩展返回Storyboard ID
