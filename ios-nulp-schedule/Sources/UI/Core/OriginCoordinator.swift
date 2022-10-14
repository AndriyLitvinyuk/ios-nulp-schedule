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
    let serviceProvider: ServiceProviderType

    init(window: UIWindow?, navigationController: NavigationControllerProtocol?, serviceProvider: ServiceProviderType) {
        self.window = window
        self.navigationController = navigationController
        self.serviceProvider = serviceProvider
    }

    func start() {
        let viewModel = ViewModel(dataSource: MainDataSource(serviceProvider: serviceProvider))
        let viewController = CoreViewController(viewModel: viewModel)
        window?.rootViewController = viewController
    }
}
