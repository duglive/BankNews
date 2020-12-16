//
//  Model.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import Foundation

protocol NewsListModel {
    var output: NewsListModelOutput? { get set }
    
    func load()
    var newsItems: [NewsListItem] { get set }
    
    var urlString: String { get set }
    var prevUrlString: String { get set }
}

protocol NewsListModelOutput {
    func updateViewFromModel()
    func createAlertAboutError()
}

struct NewsListItem {
    let title: String
    let date: String
    let viewed: Bool
}

struct RSSItem {
    var title: String
    var pubdate: String
    var description: String
}

class NewsListModelImpl: NewsListModel {
    var output: NewsListModelOutput?
    
    var storage: Storage!
    var network: NetworkService! 
    
    var newsItems: [NewsListItem] = []
    
    var prevUrlString: String = ""
    var urlString: String = "https://www.banki.ru/xml/news.rss"
    
    let dateFormatter = DateFormatter()
    
    func load() {
        
        network.parseFeed(urlString: urlString) { (rssItems) in

            if !rssItems.isEmpty {
                
                self.storage.setStorageItems(storageItems: rssItems.map{ (item) -> StorageItem in
                    
                    let date = self.dateFormatter.format(str: item.pubdate)
                    
                    return StorageItem(title: item.title,
                                       date: date,
                                       description: item.description,
                                       viewed: false)
                })
            } else {
                self.urlString = self.prevUrlString
                self.output?.createAlertAboutError()
            }
        }
        
    }
    
}

extension NewsListModelImpl: StorageOutput {
    func collectionChanged(newValue: [StorageItem]) {
        newsItems = newValue.map{ (storageItem) -> NewsListItem in
            return NewsListItem(title: storageItem.title, date: storageItem.date, viewed: storageItem.viewed)
        }
        self.output?.updateViewFromModel()
    }
}

