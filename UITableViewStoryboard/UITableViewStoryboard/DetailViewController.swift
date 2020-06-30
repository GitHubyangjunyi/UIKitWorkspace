//
//  DetailViewController.swift
//  UITableViewStoryboard
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var index: Int?
    var content: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("index:\(index!)-content:\(content!)")
    }
    

}
