//
//  Router.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import UIKit

class RouterAssembly {
    var router: Router {
        let router = RouterImpl()
        return router
    }
}

protocol Router {
    func show(in vc: UIViewController, index: Int)
}

class RouterImpl: Router {
    let newsDetailsViewControllerAssembly = NewsDetailsViewControllerAssembly()
    
    func show(in vc: UIViewController, index: Int) {
        vc.navigationController?.pushViewController(newsDetailsViewControllerAssembly.newsDetailsVC(index: index), animated: true)
    }
}
