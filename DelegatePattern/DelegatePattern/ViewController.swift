//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 杨俊艺 on 2020/6/24.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

// 王巍的博客
public class Delegate<Input, Output> {
    public init() {}
    
    private var block: ((Input) -> Output?)?
    public func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input)
        }
    }
    
    public func call(_ input: Input) -> Output? {
        return block?(input)
    }
    
    func callAsFunction(_ input: Input) -> Output? {
        return block?(input)
    }
}

public extension Delegate where Input == Void {
    func call() -> Output? {
        return call(())
    }
}
//通过设置block时就将target(通常是 self)做weak化处理并且在调用block时提供一个weak后的target的变量就可以保证在调用侧不会意外地持有target


class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textInputView = Bundle.main.loadNibNamed("TextInputView", owner: nil, options: nil)?[0] as! TextInputView
        textInputView.frame = CGRect.init(x: 0, y: 44, width: 375, height: 44)
        textInputView.backgroundColor = .green
        
        //通过delegate(on:)完成订阅
        //闭包的输入参数(self, text)和闭包体self.textLabel.text中的self,并不是原来的代表controller的self
        //而是由Delegate把self标为weak后的参数,因此直接在闭包中使用这个遮蔽变量self也不会造成循环引用
        textInputView.onConfirmInput.delegate(on: self) { (self, text) in//这里必须写(self, text) 而不是(_, text) 避免闭包内部 self.textLabel.text 中的 self直接参照了真正的self导致内存泄漏,可以认为规定写成weakSelf
            self.textLabel.text = text
        }
        self.view.addSubview(textInputView)
    }
    
}

//对Delegate的进一步改进查看目标Swift5.2callAsFunction
//现在对delegate的调用时不如闭包变量那样自然,每次需要去使用call(_:)或者 call()虽然不是什么大不了的事情但是如果能直接使用类似onConfirmInput(inputTextField.text)的形式会更简单
