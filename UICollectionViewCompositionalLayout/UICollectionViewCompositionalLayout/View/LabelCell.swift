//
//  LabelCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by 杨俊艺 on 2021/7/16.
//

import UIKit

class LabelCell: UICollectionViewCell {
    public lazy var textLabel: UILabel = {
        let textLabel = UILabel.init()
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        textLabelConstraints()
    }
    
    private func textLabelConstraints() {
        addSubview(textLabel)
        
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
}
