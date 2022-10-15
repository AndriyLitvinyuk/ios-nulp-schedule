//
//  AppService.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation
import ReactiveSwift

enum DefaultsKey: String {
    case UserGroup = "userGroup"
    case UserInstitute = "userInstitute"
    case UserSemester = "userSemester"
}

public final class AppService {
    var userGroupPlain: String? {
        UserDefaults.standard.string(forKey: DefaultsKey.UserGroup)
    }

    var userInstitutePlain: String? {
        UserDefaults.standard.string(forKey: DefaultsKey.UserInstitute)
    }

    var semesterPlain: Int? {
        UserDefaults.standard.integer(forKey: DefaultsKey.UserSemester)
    }

    var _userGroup: MutableProperty<String?> {
        .init(userGroupPlain)
    }

    var _userInstitute: MutableProperty<String?> {
        .init(userInstitutePlain)
    }

    var _semester: MutableProperty<Int?> {
        .init(semesterPlain)
    }
}

extension AppService: AppServiceProtocol {
    var userGroup: Property<String?> {
        .init(_userGroup)
    }

    var userInstitute: Property<String?> {
        .init(_userInstitute)
    }

    var semester: Property<Int?> {
        .init(_semester)
    }

    func set(userGroup: String) {
        UserDefaults.standard.set(userGroup, forKey: DefaultsKey.UserGroup)
        self._userGroup.value = userGroup
    }

    func set(userInstitute: String) {
        UserDefaults.standard.set(userInstitute, forKey: DefaultsKey.UserInstitute)
        self._userInstitute.value = userInstitute
    }

    func set(semester: Int) {
        UserDefaults.standard.set(semester, forKey: DefaultsKey.UserSemester)
        self._semester.value = semester
    }
}

extension UserDefaults {
    func string(forKey key: DefaultsKey) -> String? {
        self.string(forKey: key.rawValue)
    }

    func integer(forKey key: DefaultsKey) -> Int? {
        self.integer(forKey: key.rawValue)
    }

    func set(_ value: Any?, forKey key: DefaultsKey) {
        self.set(value, forKey: key.rawValue)
    }
}
