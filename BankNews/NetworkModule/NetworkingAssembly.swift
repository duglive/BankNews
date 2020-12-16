//
//  NetworkingAssembly.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import Foundation

class NetworkServiceAssembly {
    
    var network: NetworkService {
        return NetworkServiceImpl()
    }
    
}
