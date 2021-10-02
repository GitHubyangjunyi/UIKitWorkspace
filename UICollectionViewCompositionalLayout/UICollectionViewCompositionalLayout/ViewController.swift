//
//  ViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by 杨俊艺 on 2021/7/16.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureDataSource()
    }

    private func configureCollectionView() {
        // collectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: createLayout())
        
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .white
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // Group的25%宽和100%的高
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0 ))
        let item = NSCollectionLayoutItem.init(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        //let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 6)
        group.contentInsets = NSDirectionalEdgeInsets.init(top: 5, leading: 5, bottom: 0, trailing: 5)
        
        let section = NSCollectionLayoutSection.init(group: group)
        
        let layout = UICollectionViewCompositionalLayout.init(section: section)
        return layout
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>.init(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexPath) as? LabelCell else { fatalError("无法取出Cell") }
            cell.backgroundColor = .systemYellow
            cell.textLabel.text = "\(item)"
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>.init()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array.init(1...40))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

