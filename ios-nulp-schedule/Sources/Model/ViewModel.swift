//
//  ViewModel.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

class ViewModel<DataSourceProtocol>: ViewModelProtocol {
    let dataSource: DataSourceProtocol

    init(dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }
}
