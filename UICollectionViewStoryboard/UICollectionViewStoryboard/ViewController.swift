//
//  ViewController.swift
//  UICollectionViewStoryboard
//
//  Created by 杨俊艺 on 2020/6/22.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //如果没有勾选collectionView的Section Header和Section Footer则通过代码来设置Section的Header和Footer,勾选就相当于注册了
        //使用代码设置可以分为两种
        //1.使用Xib
        
        collectionView.register(UINib.init(nibName: "FooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        //2.未使用Xib
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        //需要注意的是无法通过init来使用UICollectionReusableView,因为UICollectionReusableView的使用依赖于重用标识,而该重用标识又被声明为只读属性并且没有提供设置该属性的初始化方法
        //所以UICollectionReusableView的使用与其他UIView的子类不同,只能使用注册的方式使用
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
    }
    
    //勾选collectionView的Section Header和Section Footer并设置重用标识header和footer并实现下面的方法
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        } else {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //已经使用Storyboard设置了Header和Footer,可以省略下面的实现,如果实现了下面的方法则使用下面的方法实现
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 50)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 100)
//    }
    
    //当没有勾选collectionView的Section Header和Section Footer且想要使用Section Header和Section Footer就必须实现以上两个方法
    //并且在这种情况下Xib中设置的大小将失效而是使用这两个方法的实现
    
}


