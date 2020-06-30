//
//  TestCell.swift
//  UITableViewStoryboard
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class TestModel {
    var icon: UIImage?
    var title: String?
    var content: String?
    var time: String?
}

//这个文件创建时不勾选Also create XIB file
//然后在Storyboard中的ViewController的View上直接添加一个UITableView并再拖入一个UITableViewCell,这就相当于注册了Cell
//可以添加多个Cell使用不同的标识进行区分
//将UITableViewCell的Class以及重用标识改成TestCell

//在Storyboard中给UITableView添加表头和表脚是直接在Cell上或者下添加一个UIView
//上方的自动称为表头,下方的自动成为表脚
class TestCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contenLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupData(testModel: TestModel) {
        iconImageView.image = testModel.icon
        titleLabel.text = testModel.title
        contenLabel.text = testModel.content
        timeLabel.text = testModel.time
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        titleLabel.text = nil
        contenLabel.text = nil
        timeLabel.text = nil
    }
}
