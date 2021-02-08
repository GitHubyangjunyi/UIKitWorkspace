//
//  ViewController.swift
//  Autorotate
//
//  Created by 杨俊艺 on 2020/7/1.
//

import UIKit

class ViewController: UIViewController {

    //实现这些方法以支持自动旋转
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//实现这些方法以支持自动旋转
//显然可以更改返回值以不仅支持纵向还支持横向模式,但是如果控制器嵌入在导航或选项卡栏控制器内部则旋转将停止工作
//在这种情况下必须继承UINavigationController的子类并且必须从顶视图控制器返回正确的值
class NavigationController: UINavigationController {

    override var shouldAutorotate: Bool {
        if let shouldRotate = self.topViewController?.shouldAutorotate {
            return shouldRotate
        }
        return super.shouldAutorotate
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let orientation = self.topViewController?.supportedInterfaceOrientations {
            return orientation
        }
        return super.supportedInterfaceOrientations
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let orientation = self.topViewController?.preferredInterfaceOrientationForPresentation {
            return orientation
        }
        return super.preferredInterfaceOrientationForPresentation
    }
}

//如果具有UITabBarController则适用相同的逻辑,但必须使用selectedIndex并基于所选视图控制器返回属性而不是顶视图控制器
//这样嵌入式控制器就可以控制支持的方向,可以使用此方法更改状态栏样式
class TabBarController: UITabBarController {

    override var shouldAutorotate: Bool {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.shouldAutorotate
        }
        return super.shouldAutorotate
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }
}
