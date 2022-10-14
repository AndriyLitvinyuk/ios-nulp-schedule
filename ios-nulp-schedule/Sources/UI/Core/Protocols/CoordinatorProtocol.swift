//
//  CoordinatorProtocol.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

public protocol CoordinatorProtocol: AnyObject {
    var navigationController: NavigationControllerProtocol? { get }
    func start()
}
