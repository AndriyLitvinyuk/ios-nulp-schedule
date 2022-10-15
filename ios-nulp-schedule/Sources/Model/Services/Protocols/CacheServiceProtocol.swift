//
//  CacheServiceProtocol.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 15.10.2022.
//

import Foundation

public struct CachedSchedule: Codable {
    let days: [Day]
    let institute: String
    let group: String
    let semester: String
    let lastUpdate: Date
}

public protocol CacheServiceProtocol {
    var cachedSchedule: CachedSchedule? { get }
    func saveSchedule(days: [Day], institute: String, group: String, semester: String)
}
