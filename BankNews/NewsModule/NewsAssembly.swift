//
//  NewsListControllerAssembly.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import UIKit

class NewsAssembly {
    private lazy var modelAssembly = NewsListModelAssembly()
    private lazy var routerAssembly = RouterAssembly()
    
    var viewController: UIViewController {
        let rootVC = NewsVC()
        rootVC.router = routerAssembly.router
        rootVC.model = modelAssembly.model
        rootVC.model.output = rootVC
        
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
}
