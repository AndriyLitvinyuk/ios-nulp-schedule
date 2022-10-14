//
//  OriginCoordinator.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import UIKit

class OriginCoordinator: CoordinatorProtocol {
    let navigationController: NavigationControllerProtocol?
    let window: UIWindow?

    init(window: UIWindow?, navigationController: NavigationControllerProtocol?) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = ViewModel()
        let viewController = CoreViewController(viewModel: viewModel)
        window?.rootViewController = viewController
    }
}
