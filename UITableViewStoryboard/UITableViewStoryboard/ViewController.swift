//
//  ViewController.swift
//  UITableViewStoryboard
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataArr:[TestModel]? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = Array.init()
        for _ in 0..<20 {
            let testModel = TestModel()
            testModel.icon = nil
            testModel.title = "36氪 36氪 36氪 36氪"
            testModel.content = "运动详情"
            testModel.time = "下午4:00"
            dataArr?.append(testModel)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" && sender is UITableViewCell {
            let tempCell = sender as! UITableViewCell
            let tempPath = tableView.indexPath(for: tempCell)
            let desVC = segue.destination as! DetailViewController
            desVC.index = tempPath?.row
            desVC.content = dataArr?[(tempPath?.row)!].content
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell") as! TestCell?
        cell?.setupData(testModel: (dataArr![indexPath.row]))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ViewController: UITableViewDelegate {
    
}

//拖一个UITableView到ViewController中,然后在拖一个UITableViewCell到UITableView中
