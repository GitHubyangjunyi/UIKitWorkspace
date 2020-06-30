//
//  ViewController.swift
//  UIKitInitPatterns
//
//  Created by 杨俊艺 on 2020/6/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


}

//UIView的初始化
class View: UIView {

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    func initialize() {
        //自定义的初始化
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {

    public convenience init(autolayout: Bool) {
        self.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = !autolayout
    }

    public static func create(autolayout: Bool = true) -> Self {
        let _self = self.init()
        let view  = _self as UIView
        view.translatesAutoresizingMaskIntoConstraints = !autolayout
        return _self
    }

    public static func createFromNib(owner: Any? = nil, options: [AnyHashable: Any]? = nil) -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: owner, options: options as? [UINib.OptionsKey : Any])?.last as! UIView
    }
}
let view = UIView(autolayout: true)

//
//
//
