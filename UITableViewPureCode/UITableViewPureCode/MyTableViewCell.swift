//
//  MyTableViewCell.swift
//  UITableViewPureCode
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.initialize()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func initialize() {
        //自定义操作
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //如果使用的是xib或者Storyboard
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
