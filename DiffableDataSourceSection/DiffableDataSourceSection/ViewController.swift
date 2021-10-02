//
//  ViewController.swift
//  DiffableDataSourceSection
//
//  Created by 杨俊艺 on 2021/7/16.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: view.bounds, style: .insetGrouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        return tableView
    }()
    
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureDataSource()
        
        
        
        navigationItem.title = "购物清单"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .plain, target: self, action: #selector(toggleEditState))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(presentAddVC))
        
        
        
        
        
        
        
        
    }

    @objc private func toggleEditState() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        navigationItem.leftBarButtonItem?.title = tableView.isEditing ? "完成" : "编辑"
        
        
    }
    
    @objc private func presentAddVC() {
        guard let addItemVC = storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as? AddItemViewController else {
              return
            }
            addItemVC.delegate = self
            present(addItemVC, animated: true)
        
        
    }

    private func configureDataSource() {
        dataSource = DataSource.init(tableView: tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let formattedPrice = String.init(format: "%.2f", item.price)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "\(item.name)\nPrice: \(formattedPrice)"
            return cell
        })
        dataSource.defaultRowAnimation = .fade
        
        var snapShot = NSDiffableDataSourceSnapshot<Category, Item>()
        for category in Category.allCases {
            let items = Item.testData().filter { item in
                item.category == category
            }
            snapShot.appendSections([category])
            snapShot.appendItems(items)
        }
        
        // 动画为true的话会有警告 原因是尝试动画时视图还没出现在视图层次结构中
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
}

extension ViewController: AddItemViewControllerDelegate {
    func didAddNewItem(_ addItemViewController: AddItemViewController, item: Item) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([item], toSection: item.category)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    
}

