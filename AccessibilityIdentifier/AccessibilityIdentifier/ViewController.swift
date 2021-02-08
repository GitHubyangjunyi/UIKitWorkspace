//
//  ViewController.swift
//  AccessibilityIdentifier
//
//  Created by 杨俊艺 on 2020/7/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


}

extension UIView {

    var id: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }

    func view(withId id: String) -> UIView? {
        if self.id == id {
            return self
        }
        for view in self.subviews {
            if let view = view.view(withId: id) {
                return view
            }
        }
        return nil
    }
}

//对UIView类进行了简单的扩展,因此现在可以使用适当的字符串值来唯一地标识视图层次结构中的任何视图对象
//这是一个很好的解决方案,现在我可以用一种非常不错的方式命名我的视图,将名称存储在下方accessibilityIdentifier将有助于UI测试

//第二种方法使用枚举
//主要思想是Int为每个视图标识符都具有一个基于枚举的枚举,因此基本上可以使用该tag属性存储枚举的rawValue
//它仍然不如上面的那个好但是比依赖纯整数更安全
enum ViewIdentifier: Int {
    case submitButton
}

extension UIView {

    var identifier: ViewIdentifier? {
        set {
            if let value = newValue {
                self.tag = value.rawValue
            }
        }
        get {
            return ViewIdentifier(rawValue: self.tag)
        }
    }

    func view(withId id: ViewIdentifier) -> UIView? {
        return self.viewWithTag(id.rawValue)
    }
}
