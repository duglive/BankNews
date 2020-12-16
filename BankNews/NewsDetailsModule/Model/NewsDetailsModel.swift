//
//  NewsDetailsModel.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import Foundation

protocol NewsDetailsModel {
    func load()
    func makeNewsViewed()
    
    var news: NewsDetailsItem! { get set }
}

struct NewsDetailsItem {
    let title: String
    let date: String
    let description: String
}

class NewsDetailsModelImpl: NewsDetailsModel {
    var storage: Storage!
    var index: Int!
    
    var news: NewsDetailsItem!
    
    func load() {
        news = NewsDetailsItem(title: storage.storageItems[index].title, date: storage.storageItems[index].date, description: storage.storageItems[index].description)
    }
    
    func makeNewsViewed() {
        storage.changeStorageItemViewedState(at: index)
    }
    
}
