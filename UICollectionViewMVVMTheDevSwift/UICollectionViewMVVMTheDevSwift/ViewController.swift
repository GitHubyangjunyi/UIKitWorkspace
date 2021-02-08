//
//  ViewController.swift
//  UICollectionViewMVVMTheDevSwift
//
//  Created by 杨俊艺 on 2020/7/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    
}


//集合视图的第一个问题是大小计算,必须提供集合视图中每个单元的大小
//如果所有内容在集合视图中都具有固定的大小则只需在流布局本身上设置大小属性
//如果您需要每个项目的动态大小则可以实现流布局委托UICollectionViewDelegateFlowLayout并返回布局系统的确切大小
//如果您需要更多控制权则可以创建一个从CollectionView(Flow)Layout派生的新布局子类并在那里进行所有尺寸计算
