//
//  CollectionViewController.swift
//  SelfSizingCell
//
//  Created by 杨俊艺 on 2020/7/2.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var twoColumns = false
    
    var dataSource: [String] = [
        "Donec id elit non mi porta gravida at eget metus.",
        "Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
        "Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vestibulum id ligula porta felis euismod semper. Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo.",
        "Maecenas faucibus mollis interdum.",
        "Donec ullamcorper nulla non metus auctor fringilla. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum.",
        "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum.",
        "Donec id elit non mi porta gravida at eget metus.",
        "Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
        "Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vestibulum id ligula porta felis euismod semper. Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo.",
        "Maecenas faucibus mollis interdum.",
        "Donec ullamcorper nulla non metus auctor fringilla. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum.",
        "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum.",
    ]
}

extension CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                                 target: self,
                                                                 action: #selector(self.toggleColumns))

        self.collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 64, height: 64)
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 20
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            //在viewDidLoad方法内部必须在集合视图上设置estimatedItemSize属性,如果输入的尺寸错误则自动旋转将无法正常工作
            flowLayout.estimatedItemSize = CGSize(width: self.preferredWith(forSize: self.view.bounds.size), height: 64)
        }

        self.collectionView?.reloadData()

        NotificationCenter.default.addObserver(self.collectionView!,
                                               selector: #selector(UICollectionView.reloadData),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
    }
    
    //在旋转方法内部必须使集合视图布局无效并在发生过渡时重新计算可见的像元大小
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard
            let previousTraitCollection = previousTraitCollection,
            self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass ||
            self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass
        else {
            return
        }
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
        self.collectionView?.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
        self.estimateVisibleCellSizes(to: size)
        
        coordinator.animate(alongsideTransition: { context in
            
        }, completion: { context in
            self.collectionView?.collectionViewLayout.invalidateLayout()
        })
    }

}

extension CollectionViewController {

    @objc func toggleColumns() {
        self.twoColumns = !self.twoColumns

        self.collectionView?.collectionViewLayout.invalidateLayout()
        self.collectionView?.reloadData()
    }

    //有两种辅助方法可以计算估计的项目大小的首选宽度并重新计算可见的单元格大小
    func preferredWith(forSize size: CGSize) -> CGFloat {
        var columnFactor: CGFloat = 1.0
        if self.twoColumns {
            columnFactor = 2.0
        }
        return (size.width - 30) / columnFactor
    }

    func estimateVisibleCellSizes(to size: CGSize) {
        guard let collectionView = self.collectionView else {
            return
        }
        
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: self.preferredWith(forSize: size), height: 64)
        }
        
        collectionView.visibleCells.forEach({ cell in
            if let cell = cell as? CollectionViewCell {
                cell.setPreferred(width: self.preferredWith(forSize: size))
            }
        })
    }
}

extension CollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath) as! CollectionViewCell
        
        cell.setPreferred(width: self.preferredWith(forSize: collectionView.frame.size))

        cell.dynamicLabel?.text = self.dataSource[indexPath.row]
        
        return cell
    }
    
}

//快照未渲染的视图将导致快照为空,确保在快照之前或屏幕更新后快照至少已渲染一次视图
