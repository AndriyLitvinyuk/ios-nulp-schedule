//
//  DataSource.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

class MainDataSource: DataSourceProtocol {
    typealias ServiceProviderType = ParserServiceProvider
    let parserService: ParserServiceProtocol
    init(serviceProvider: ServiceProviderType) {
        self.parserService = serviceProvider.parserService
    }
}
