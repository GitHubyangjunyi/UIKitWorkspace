//
//  CustomView.swift
//  XibCustomViewWithOutletsAndActionsCleanExtension
//
//  Created by 杨俊艺 on 2020/6/30.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UINib {
    func instantiate() -> Any? {
        return self.instantiate(withOwner: nil, options: nil).first
    }
}

extension UIView {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    static func instantiate(autolayout: Bool = true) -> Self {
        // generic helper function
        func instantiateUsingNib<T: UIView>(autolayout: Bool) -> T {
            let view = self.nib.instantiate() as! T
            view.translatesAutoresizingMaskIntoConstraints = !autolayout
            return view
        }
        return instantiateUsingNib(autolayout: autolayout)
    }
}

class CustomView: UIView {

    @IBOutlet weak var textLabel: UILabel!
}

// let view = CustomView.instantiate()

//可以从视图实例中省略所有xib加载机制,我们可以创建一组扩展以拥有带有来自xib文件的自定义视图类的漂亮视图加载器
//这样就不再需要容器视图,文件所有者也可以删除,这与Apple创建的表和集合的可重用单元格大致相同
//以这种方式不能再以编程方式使用默认的UIView初始化方法,因为xib文件将负责初始化过程
//同样如果尝试使用情节提要或xib文件中的这种自定义视图则将无法使用出口,因为不会加载视图类的对应xib
//否则如果尝试多次加载它则会陷入无限循环,最终您的应用程序将崩溃

//就像这次使用表或集合视图单元格一样必须在视图对象上设置自定义视图类而不是文件的所有者,必须连接插座变量
//从现在开始应该始终在自定义视图对象上使用实例化方法,好消息是该函数是通用的
