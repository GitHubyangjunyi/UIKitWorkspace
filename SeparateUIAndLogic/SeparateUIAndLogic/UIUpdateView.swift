//
//  UIUpdateView.swift
//  SeparateUIAndLogic
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class UIUpdateView: UIView {

    @IBOutlet weak var uiBtn: UIButton!
    
    @IBAction func updateUI(_ sender: UIButton) {
        self.uiBtn.setTitle("已经按过", for: .normal)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }
    
}
