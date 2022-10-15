//
//  ParserServiceProtocol.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation
import ReactiveSwift

enum ParserError: LocalizedError {
    case InvalidData
}

enum GetParamsKey: String {
    case InstituteKey = "departmentparent_abbrname_selective"
    case GroupKey = "studygroup_abbrname_selective"
    case SemesterKey = "semestrduration"
}

public protocol ParserServiceProtocol {
    func days(institute: String, group: String, semester: String) -> SignalProducer<[Day], Error>
    func institues() -> SignalProducer<[String], Error>
    func studentGroups(institute: String) -> SignalProducer<[String], Error> 
}
