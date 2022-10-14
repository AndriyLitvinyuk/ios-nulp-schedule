//
//  Array+Extensions.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation

public extension Array {
    func element(at index: Int) -> Element? {
        guard self.count > index else {
            return nil
        }
        return self[index]
    }
}
