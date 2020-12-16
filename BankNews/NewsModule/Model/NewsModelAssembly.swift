//
//  NewsModelAssembly.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import Foundation

class NewsListModelAssembly {
    lazy var storageAssembly = StorageAssembly()
    lazy var networkAssembly = NetworkServiceAssembly()
    
    var model: NewsListModel {
        let model = NewsListModelImpl()
        
        model.storage = storageAssembly.storage()
        model.network = networkAssembly.network
        
        model.storage.output = model
        
        return model
    }
}
