//
//  NavigationController.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import UIKit

class NavigationController: UINavigationController, NavigationControllerProtocol {
    func push(_ viewController: UIViewController, animated: Bool) {
        self.pushViewController(viewController, animated: true)
    }
}
