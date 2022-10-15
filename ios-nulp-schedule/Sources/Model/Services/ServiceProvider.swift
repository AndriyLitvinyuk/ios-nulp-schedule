//
//  ServiceProvider.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

public final class ServiceProvider: ServiceProviderType {
    public let parserService: ParserServiceProtocol
    public let appService: AppServiceProtocol
    public let cacheService: CacheServiceProtocol

    init() {
        self.parserService = ParserService()
        self.appService = AppService()
        self.cacheService = CacheService()
    }
}
