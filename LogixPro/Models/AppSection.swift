//
//  AppSection.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import Foundation

enum AppSection: Identifiable, Hashable {
    case app(name: String, iconName: String, phones: [PhoneSection])
    case home(name: String, iconName: String)
    
    var id: String {
        return UUID().uuidString
    }
}

struct PhoneSection: Identifiable, Hashable {
    var name: String?
    var iosVersion: String?
    var id: String {
        return UUID().uuidString
    }
}

extension AppSection {
    static func appMock() -> [AppSection] {
        let phone1 = PhoneSection(name: "iPhone 14 Pro", iosVersion: "iOS 17.0")
        let phone2 = PhoneSection(name: "iPhone 15 Pro Max", iosVersion: "iOS 17.2")
        return [.app(name: "Grow Food", iconName: "folder", phones: [phone1, phone2])]
                //.app(name: "Priem", iconName: "folder")]
    }
    
    static func homeMock() -> [AppSection] {
        return [.home(name: "Home", iconName: "house")]
    }
}
