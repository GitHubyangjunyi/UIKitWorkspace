//
//  ViewController.swift
//  UITableViewCellExpand
//
//  Created by 杨俊艺 on 2021/9/13.
//

import UIKit

struct Section {
    let title: String
    let options: [String]
    var isOpened = false
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        
        return tableView
    }()
    
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sections = [
            Section.init(title: "Section 1", options: [1, 2, 3].compactMap({ return "Cell \($0)"})),
            Section.init(title: "Section 2", options: [1, 2, 3].compactMap({ return "Cell \($0)"})),
            Section.init(title: "Section 3", options: [1, 2, 3].compactMap({ return "Cell \($0)"})),
            Section.init(title: "Section 4", options: [1, 2, 3].compactMap({ return "Cell \($0)"})),
        ]
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section].isOpened {
            return sections[section].options.count + 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // 每个Section的首行特殊对待
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
            return cell
        } else {
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            
        }
        
    }
}
