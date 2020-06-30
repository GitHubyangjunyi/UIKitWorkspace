//
//  TextInputView.swift
//  DelegatePattern
//
//  Created by 杨俊艺 on 2020/6/24.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class TextInputView: UIView {

    @IBOutlet var inputTextField: UITextField!
    
    let onConfirmInput = Delegate<String?, Void>()

    @IBAction func confirmButtonPressed(_ sender: Any) {
        //onConfirmInput.call(inputTextField.text)
        onConfirmInput(inputTextField.text)//使用Swift 5.2新特性callAsFunction
        //这个特性非常适合把Delegate.call简化只需要加入对应的callAsFunction实现并调用block就行了
        //现在onConfirmInput的调用看起来就和一个闭包完全一样了
    }
}
