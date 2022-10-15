//
//  ServiceProviderType.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

public protocol ParserServiceProvider {
    var parserService: ParserServiceProtocol { get }
}

public protocol AppServiceProvider {
    var appService: AppServiceProtocol { get }
}

public protocol CacheServiceProvider {
    var cacheService: CacheServiceProtocol { get }
}

public protocol ServiceProviderType: ParserServiceProvider & AppServiceProvider & CacheServiceProvider { }
