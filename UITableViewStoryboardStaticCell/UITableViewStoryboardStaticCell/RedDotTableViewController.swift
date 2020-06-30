//
//  RedDotTableViewController.swift
//  UITableViewStoryboardStaticCell
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class RedDotTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //下面的两个方法可以注释掉
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //不能在viewDidLoad中添加红点,因为此时cell还没准备好
        if indexPath.row == 0 {
            let redDot = UIView.init(frame: CGRect.init(x: cell.contentView.frame.size.width - 40, y: (cell.contentView.frame.size.height - 8) / 2, width: 8, height: 8))
            redDot.backgroundColor = .red
            redDot.layer.cornerRadius = 4.0
            cell.contentView.addSubview(redDot)
        }
    }

    

}
