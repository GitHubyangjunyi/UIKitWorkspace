//
//  ViewController.swift
//  UIPageViewController
//
//  Created by 杨俊艺 on 2021/7/20.
//

import UIKit

class ViewController: UIPageViewController {
    var pages = [UIViewController]()
    let pageControl = UIPageControl.init()
    let initialPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        
        
        style()
        
        layout()
        
        
    }

    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        
        let vc1 = UIViewController.init()
        vc1.view.backgroundColor = .gray
        let vc2 = UIViewController.init()
        vc2.view.backgroundColor = .black
        let vc3 = UIViewController.init()
        vc3.view.backgroundColor = .red
        
        pages.append(vc1)
        pages.append(vc2)
        pages.append(vc3)
        
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        
        
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = initialPage
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        
    }
    
    func layout() {
        view.addSubview(pageControl)
        
        pageControl.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1).isActive = true
        
        
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}
