//
//  StorageAssembly.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

class StorageAssembly { 
    private static let storage = StorageImpl()
    
    func storage() -> Storage {
        return StorageAssembly.storage
    }
}
