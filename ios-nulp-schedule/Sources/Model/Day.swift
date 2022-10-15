//
//  Day.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 15.10.2022.
//

import Foundation

enum LessonPosition: String, Codable {
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

struct Lesson: Codable {
    let position: LessonPosition
    let name: String?
    let description: String?
    let type: String?
    let url: URL?
}

struct FullLesson: Codable {
    let number: Int
    let lessons: [Lesson]
}

public struct Day: Codable {
    let day: String
    let lessons: [FullLesson]
}
