//
//  ViewController.swift
//  UIPageViewControllerSecond
//
//  Created by 杨俊艺 on 2021/7/20.
//

import UIKit

class ViewController: UIViewController {

    var pageViewController: UIPageViewController!
    
    lazy var viewControllers: [UIViewController] = {
        let redVC = UIViewController.init()
        redVC.view.backgroundColor = .red
        redVC.title = "red"
        
        let greenVC = UIViewController.init()
        greenVC.view.backgroundColor = .green
        greenVC.title = "green"
        
        let blueVC = UIViewController.init()
        blueVC.view.backgroundColor = .blue
        blueVC.title = "blue"
        
        return [redVC, greenVC, blueVC]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController?.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController?.didMove(toParent: self)
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index - 1 >= 0, viewControllers.count > index - 1 else { return nil }
        
        return viewControllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index + 1 >= 0, viewControllers.count > index + 1 else { return nil }
        return viewControllers[index + 1]
    }
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            for vc in self.pageViewController.viewControllers! {
                print(vc.title)
            }
        }
    }
}
