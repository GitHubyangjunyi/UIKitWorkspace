//
//  ViewController.swift
//  LocalizedString
//
//  Created by 杨俊艺 on 2021/9/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel.init()
        label.text = "Hello".localized()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        
        view.addSubview(label)
        label.frame = view.bounds
        
    }


}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
