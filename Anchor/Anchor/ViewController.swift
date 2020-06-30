//
//  ViewController.swift
//  Anchor
//
//  Created by 杨俊艺 on 2020/6/30.
//

import UIKit

class ViewController: UIViewController {

    weak var testView: UIView!
    weak var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!

    override func loadView() {
        super.loadView()

        let testView = UIView(frame: .zero)
        testView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(testView)

        let topConstraint = testView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomConstraint = testView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([
              topConstraint,
              testView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
              testView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
              bottomConstraint,
          ])

        let heightConstraint = testView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)

        self.testView = testView
        self.topConstraint = topConstraint
        self.bottomConstraint = bottomConstraint
        self.heightConstraint = heightConstraint
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIDevice.current.userInterfaceIdiom == .pad)
        print(UIScreen.main.nativeBounds)       //1125x2436
        print(UIScreen.main.bounds)           //375x812
        
        self.testView.backgroundColor = .red

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        self.view.addGestureRecognizer(tap)
    }

    @objc func tapped() {
        if self.topConstraint.constant != 0 {
            self.topConstraint.constant = 0
        }
        else {
            self.topConstraint.constant = 64
        }

        if self.bottomConstraint.isActive {
            NSLayoutConstraint.deactivate([self.bottomConstraint])
            NSLayoutConstraint.activate([self.heightConstraint])

        }
        else {
            NSLayoutConstraint.deactivate([self.heightConstraint])
            NSLayoutConstraint.activate([self.bottomConstraint])
        }

        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
}


//UIViewController生命周期方法按以下顺序被调用：
//loadView
//viewDidLoad
//viewWillAppear
//viewWillLayoutSubviews
//viewDidLayoutSubviews
//viewDidAppear
//在自动布局前时代必须在viewDidLayoutSubviews方法内部进行布局计算,现在不需要了

//使用自动布局创建视图层次结构的基本规则：
//永远不要自己手动计算帧
//用.zero矩形框初始化视图
//设为translatesAutoresizingMaskIntoConstraints假
//addSubview
//创建并激活您的布局约束NSLayoutConstraint.activate
//用于loadView代替viewDidLoad创建具有约束的视图
//通过使用weak属性来照顾内存管理
//viewDidLoad设置其他所有属性例如背景色等


//如果您通过界面生成器IB创建完全相同的内容则系统将loadView免费为您“制作”该方法但您必须设置IBOutlet对该视图的引用
//        let square = UIView()
//        self.view.addSubview(square)
//        square.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            square.widthAnchor.constraint(equalToConstant: 64),
//            square.heightAnchor.constraint(equalToConstant: 64),
//            square.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            square.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        ])
//
//        square.layer.shadowColor = UIColor.black.cgColor
//        square.layer.shadowOpacity = 1
//        square.layer.shadowOffset = .zero
//        square.layer.shadowRadius = 10
//
//        shadowColor   设置阴影的颜色必须为CGColor
//        shadowOpacity 设置阴影的透明度0是不可见的而1则尽可能强
//        shadowOffset  设置阴影应距视图多远以提供3D偏移效果
//        shadowRadius  设置阴影的宽度


//水平和垂直居中
//        testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//
//设置宽高比
//        testView.widthAnchor.constraint(equalToConstant: 64)
//        testView.widthAnchor.constraint(equalTo: testView.heightAnchor, multiplier: 16/9)
//使用乘数设置宽高比
//        testView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3)
//        testView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2/3)
//
//注意负数的使用
//        testView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32)
//        testView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32)
//        testView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
//        testView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32)
//使用安全区域布局指南
//        child.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        child.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        child.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor + 50).isActive = true
//        child.widthAnchor.constraint(equalToConstant: 128).isActive = true

//约束的常量值设置动画效果以及切换各种约束的基本原理
//规则：
//将标准UIView动画与layoutIfNeeded结合
//始终先停用约束
//强烈遵守停用的约束


//支持多种屏幕的自适应布局
class ViewControllerx: UIViewController {

    weak var testView: UIView!

    var regularConstraints: [NSLayoutConstraint] = []
    var compactConstraints: [NSLayoutConstraint] = []

    override func loadView() {
        super.loadView()

        let testView = UIView(frame: .zero)
        testView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(testView)

        self.regularConstraints = [
            testView.widthAnchor.constraint(equalToConstant: 64),
            testView.widthAnchor.constraint(equalTo: testView.heightAnchor),
            testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ]

        self.compactConstraints = [
            testView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            testView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            testView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ]

        self.activateCurrentConstraints()

        self.testView = testView
    }

    //根据不同的方向设置不同的布局约束
    private func activateCurrentConstraints() {
        NSLayoutConstraint.deactivate(self.compactConstraints + self.regularConstraints)

        if self.traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(self.regularConstraints)
        }
        else {
            NSLayoutConstraint.activate(self.compactConstraints)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.testView.backgroundColor = .red
    }

    // MARK: - rotation support

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    // MARK: - trait collections

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self.activateCurrentConstraints()
    }
}

//设备检测
//UIDevice.current.userInterfaceIdiom == .pad
//屏幕尺寸
//UIScreen.main.nativeBounds   // 1125x2436
//UIScreen.main.bounds         // 375x812
