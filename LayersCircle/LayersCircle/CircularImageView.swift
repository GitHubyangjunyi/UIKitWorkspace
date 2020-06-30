//
//  CircularImageView.swift
//  LayersCircle
//
//  Created by 杨俊艺 on 2020/6/30.
//

import UIKit

class CircularImageView: UIImageView {
    
    override var bounds: CGRect {
        didSet {
            self.layer.cornerRadius = round(self.bounds.size.width / 2.0)
        }
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
        self.backgroundColor = .yellow
    }
}

