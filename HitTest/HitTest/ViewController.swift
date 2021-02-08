//
//  ViewController.swift
//  HitTest
//
//  Created by 杨俊艺 on 2021/1/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let v1 = TouchesExampleView.init(frame: .init(x: 100, y: 100, width: 200, height: 200))
        v1.backgroundColor = .red
        v1.des = "v1"
        let v2 = TouchesExampleView.init(frame: .init(x: 10, y: 10, width: 100, height: 100))
        v2.backgroundColor = .green
        v2.des = "v2"
        let v3 = TouchesExampleView.init(frame: .init(x: 10, y: 10, width: 50, height: 50))
        v3.backgroundColor = .gray
        v3.des = "v3"
        view.addSubview(v1)
        v1.addSubview(v2)
        v2.addSubview(v3)
        
        
        
    }


}

class TouchesExampleView: UIView {
    
    var des: String = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Began on \(des)")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Moved on \(des)")
        super.touchesMoved(touches, with: event)
    }
  
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Ended on \(des)")
        super.touchesEnded(touches, with: event)
    }
}
