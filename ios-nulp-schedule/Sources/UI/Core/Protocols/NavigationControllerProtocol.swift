//
//  NavigationControllerProtocol.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import UIKit

public protocol NavigationControllerProtocol: AnyObject {
    func push(_ viewController: UIViewController, animated: Bool)
}
