//
//  ViewController.swift
//  StylingBySubclassing
//
//  Created by 杨俊艺 on 2020/7/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let titleLabel = TitleLabel()
        titleLabel.text = "自定义的标签"
        titleLabel.backgroundColor = UIColor.red
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate(titleLabel.constraints(in: self.view))
        
        
    }


}

struct App {

    struct Fonts {
        static let title = UIFont.systemFont(ofSize: 32)
        static let heading = UIFont.systemFont(ofSize: 24)
        static let subheading = UIFont.systemFont(ofSize: 20)
        static let body = UIFont.systemFont(ofSize: 16)
        static let small = UIFont.systemFont(ofSize: 14)
    }

    struct Colors {
        static let title = UIColor.blue
        static let heading = UIColor.black
        static let background = UIColor.white
    }

    struct Icons {
        static let back = UIImage(named: "BackIcon")!
        static let share = UIImage(named: "ShareIcon")!
    }

}


//这样虽然这不会让我进行动态样式设置所以我无法在浅色/深色主题之间切换
//但是我真的不介意因为在大多数情况下这不是必需的

//结构与枚举：
//我可以使用枚举代替具有静态属性的结构但是在这种情况下
//我喜欢这种方法的简单性,我不想弄乱接受枚举的原始值或扩展名

//如果您必须支持多个主题怎么办
//这不是什么大问题您可以根据需要定义协议并根据需要实施所需的主题协议
//真正的问题是当您必须在主题之间切换时因为必须刷新/重新加载整个UI
//有一些最佳做法
//例如可以使用NSNotificationCenter以便在发生主题更改时通知应用程序中的每个视图/控制器刷新
//另一个解决方案是简单地重新初始化应用程序的整个UI,因此这意味着您基本上从头开始使用全新的rootViewController😱


class TitleLabel: UILabel {

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
        self.textColor = App.Colors.title
        self.font = App.Fonts.title
    }

    func constraints(in view: UIView) -> [NSLayoutConstraint] {
        return [
            self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }
}

//我最喜欢这种方法的地方是我的约束将在正确的位置
//因此它们不会膨胀我的视图控制器的loadView方法
//您还可以根据当前情况使用额外的参数创建多个约束变量,因此它可以针对每种情况进行扩展

//该解决方案的缺点是由于界面构建器的支持,视图初始化有点混乱
//您必须子类化每种视图类型并一次又一次地复制并粘贴初始化方法
//为了解决这个问题我通常以为自己的样式视图创建父类来结束
//这是标签的抽象基类的示例
class Label: UILabel {

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
//所以从现在开始我只需要重写该initialize方法

class TitleLabelx: Label {

    override func initialize() {
        super.initialize()

        self.font = App.Fonts.title
        self.textColor = App.Colors.title
        self.text = "titleLabel.text"
    }
}
//它好多了因为我不再需要处理所需的视图初始化方法
//默认情况下自动调整大小功能也将关闭❤️


