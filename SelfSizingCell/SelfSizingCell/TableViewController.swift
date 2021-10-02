//
//  ViewController.swift
//  SelfSizingCell
//
//  Created by 杨俊艺 on 2020/7/1.
//

import UIKit

class TableViewController: UITableViewController {

    var dataSource: [String] = [
        "Donec id elit non mi porta gravida at eget metus.",
        "Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
        "Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vestibulum id ligula porta felis euismod semper. Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo.",
        "Maecenas faucibus mollis interdum.",
        "Donec ullamcorper nulla non metus auctor fringilla. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum.",
        "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum.",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableView.automaticDimension
        
        //该estimatedRowHeight属性将告诉系统tableview应该尝试动态计算每个单元格的高度
        //您还应该将rowHeight属性更改为自动尺寸,如果不这样做则系统将使用静态单元格高度-您可以在单元格上设置的界面生成器高度
        //现在构建并运行将拥有一个带有自定义大小单元格的出色表格视图,甚至可以旋转设备它将在两个方向上都能正常工作
        
        //NotificationCenter.default.addObserver(self.tableView!, selector: #selector(UITableView.reloadData), name: UIContentSizeCategory.didChangeNotification, object: nil)
        
        
        //如果您在iOS辅助功能设置下更改了文字大小表格视图将反映这些更改因此它将使布局适应新值
        //表格视图的字体大小将根据滚动条的值更改,您可能需要订阅UIContentSizeCategory.didChangeNotification以检测大小变化并重新加载UI,此功能称为动态类型
        
        
    }
}

extension TableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        cell.dynamicLabel?.text = self.dataSource[indexPath.row]
        //cell.dynamicLabel.font  = UIFont.preferredFont(forTextStyle: .body)

        return cell
    }
}

