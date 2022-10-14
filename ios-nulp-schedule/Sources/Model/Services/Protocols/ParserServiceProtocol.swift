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

enum LessonPosition: String {
    case TopLeft = "sub_1_chys"
    case TopRight = "sub_2_chys"
    case BottomLeft = "sub_1_znam"
    case BottomRight = "sub_2_znam"
    case Full = "group_full"
    case Left = "sub_1_full"
    case Right = "sub_2_full"
    case Top = "group_chys"
    case Bottom = "group_znam"
}

struct Lesson {
    let position: LessonPosition
    let name: String?
    let description: String?
    let type: String?
    let url: URL?
}

struct FullLesson {
    let number: Int
    let lessons: [Lesson]
}

public struct Day {
    let day: String
    let lessons: [FullLesson]
}

public protocol ParserServiceProtocol {
    func days(institute: String, group: String, semester: String) -> SignalProducer<[Day], Error>
    func institues() -> SignalProducer<[String], Error>
    func studentGroups(institute: String) -> SignalProducer<[String], Error> 
}
