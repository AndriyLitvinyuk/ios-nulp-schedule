//
//  ServiceProvider.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

class ServiceProvider: ServiceProviderType {
    let parserService: ParserServiceProtocol

    init() {
        self.parserService = ParserService()
    }
}
