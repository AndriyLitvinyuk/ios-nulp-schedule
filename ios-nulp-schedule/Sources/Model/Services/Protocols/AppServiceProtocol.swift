//
//  AppServiceProtocol.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation
import ReactiveSwift

public protocol AppServiceProtocol {
    var userGroup: Property<String?> { get }
    var userInstitute: Property<String?> { get }
    var semester: Property<Int?> { get }
    func set(userGroup: String)
    func set(userInstitute: String)
    func set(semester: Int)
}
