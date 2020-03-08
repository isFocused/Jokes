//
//  TabBarController.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var firstViewController: UIViewController?
    var secondViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstViewController = getVc(viewController: ViewController(),
                                        tabBarSystemItem: .contacts,
                                        tag: 1)

        secondViewController = getVc(viewController: ViewControllerTwo(),
                                     tabBarSystemItem: .bookmarks,
                                     tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList as? [UIViewController]
    }
    
    private func getVc(viewController: UIViewController, tabBarSystemItem: UITabBarItem.SystemItem, tag: Int) -> UIViewController {
        let firstViewController = UINavigationController(rootViewController: viewController)
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarSystemItem, tag: tag)
        return firstViewController
    }
}
