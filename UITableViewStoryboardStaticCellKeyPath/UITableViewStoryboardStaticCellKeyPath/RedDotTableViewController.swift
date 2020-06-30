//
//  RedDotTableViewController.swift
//  UITableViewStoryboardStaticCellKeyPath
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //不能在viewDidLoad中添加红点,因为此时cell还没准备好
        if indexPath.row == 0 {
            if let redDot = cell.contentView.viewWithTag(123) {
                redDot.isHidden = false
            }
        }
    }

}

//将Storyboard中的cell的Style标签设置为Custom然后向cell中添加一个Label,再添加一个红点View
//选中红点View并在User Defined Runtime Attribute中添加一个layer.cornerRadius的Key Path,将Type设置为Number,Value为4,并设置tag为123,勾选Hidden隐藏红点View
