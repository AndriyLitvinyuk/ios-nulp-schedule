//
//  CacheService.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 15.10.2022.
//

import Foundation
import ReactiveSwift

public final class CacheService: CacheServiceProtocol {
    public var cachedSchedule: CachedSchedule? {
        UserDefaults.standard.object(forKey: "cachedSchedule") as? CachedSchedule
    }

    public func saveSchedule(days: [Day], institute: String, group: String, semester: String) {
        UserDefaults.standard.set(
            CachedSchedule(
                days: days,
                institute: institute,
                group: group,
                semester: semester,
                lastUpdate: Date()
            ), forKey: "cachedSchedule")
    }
}
