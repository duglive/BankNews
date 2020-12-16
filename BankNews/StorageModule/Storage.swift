//
//  Storage.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import Foundation

protocol Storage {
    var output: StorageOutput? { get set }
    func setStorageItems(storageItems: [StorageItem])
    
    func changeStorageItemViewedState(at index: Int)
    
    var storageItems: [StorageItem] { get set }
}

protocol StorageOutput {
    func collectionChanged(newValue: [StorageItem])
}

struct StorageItem {
    let title: String
    let date: String
    let description: String
    let viewed: Bool
}

class StorageImpl: Storage {
    var output: StorageOutput?
    
    var storageItems: [StorageItem] = []
    
    func setStorageItems(storageItems: [StorageItem]) {
        self.storageItems = storageItems
        output?.collectionChanged(newValue: storageItems)
    }
    
    func changeStorageItemViewedState(at index: Int) {
        self.storageItems[index] = StorageItem(title: storageItems[index].title, date: storageItems[index].date, description: storageItems[index].description, viewed: true)
        output?.collectionChanged(newValue: storageItems)
    }
}
