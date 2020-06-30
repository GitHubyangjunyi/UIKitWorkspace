//
//  ToolBar.swift
//  XibDALFactory
//
//  Created by 杨俊艺 on 2020/6/23.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

enum ToolBarType {
    case normal
    case edit
}

class ToolBar: UIView {

    class func toolBar(type: ToolBarType) -> ToolBar? {
        if type == .normal {
            return Bundle.main.loadNibNamed("ToolBar", owner: nil, options: nil)?[0] as? ToolBar
        } else if type == .edit {
            return Bundle.main.loadNibNamed("ToolBar", owner: nil, options: nil)?[1] as? ToolBar
        } else {
            return nil
        }
    }

    func handleEvent() {
        //由子类重写
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        handleEvent()
    }
    
}


class NormalToolBar: ToolBar {
    override func handleEvent() {
        backgroundColor = .red
    }
}

class EditToolBar: ToolBar {
    override func handleEvent() {
        backgroundColor = .green
    }
}
