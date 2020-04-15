//
//  TabBarController.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Private property
    
    private var firstViewController: UIViewController?
    private var secondViewController: UIViewController?
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewController = createNavigationController(JokesViewController(),
                                                         title: "Jokes",
                                                         image: #imageLiteral(resourceName: "jokesIcon"),
                                                         tag: 0)
        secondViewController = createNavigationController(WebViewController(),
                                                          title: "API",
                                                          image: #imageLiteral(resourceName: "apiIcon"),
                                                          tag: 1)
        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList as? [UIViewController]
    }
    
    // MARK: - Private methods
    
    private func createNavigationController(_ viewController: UIViewController, title: String, image: UIImage, tag: Int) -> UIViewController {
        let controller = UINavigationController(rootViewController: viewController)
        controller.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return controller
    }
}
