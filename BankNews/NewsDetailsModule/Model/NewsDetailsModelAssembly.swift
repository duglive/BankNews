//
//  NewsDetailsModelAssembly.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import Foundation

class NewsDetailsModelAssembly {
    private lazy var storageAssembly = StorageAssembly()
    
    func model(with index: Int) -> NewsDetailsModel {
        let model = NewsDetailsModelImpl()
        model.storage = storageAssembly.storage()
        model.index = index
        return model
    }
    
}
