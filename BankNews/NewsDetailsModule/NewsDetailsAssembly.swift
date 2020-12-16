//
//  NewsDetailsAssembly.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import UIKit

class NewsDetailsViewControllerAssembly {
    private lazy var modelAssembly = NewsDetailsModelAssembly()
    
    func newsDetailsVC(index: Int) -> UIViewController {
        
        let viewController = NewsDetailsViewController()
        viewController.model = modelAssembly.model(with: index)
        
        return viewController
    }
}
