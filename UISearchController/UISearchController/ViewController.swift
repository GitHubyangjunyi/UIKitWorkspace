//
//  ViewController.swift
//  UISearchController
//
//  Created by 杨俊艺 on 2021/9/13.
//

import UIKit

class ResultsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}




class ViewController: UIViewController {

    let searchController = UISearchController.init(searchResultsController: ResultsVC.init())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        
        
        
        
        
    }


}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .yellow
        
        
        
    }
    
    
}
