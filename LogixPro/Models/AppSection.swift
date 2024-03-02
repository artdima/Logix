//
//  AppSection.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import Foundation

enum AppSection: Identifiable, Hashable {
    case app(name: String, iconName: String)
    case home(name: String, iconName: String)
    
    var id: String {
        return UUID().uuidString
    }
}

extension AppSection {
    static func appMock() -> [AppSection] {
        return [.app(name: "Grow Food", iconName: "folder"),
                .app(name: "Priem", iconName: "folder")]
    }
    
    static func homeMock() -> [AppSection] {
        return [.home(name: "Home", iconName: "house")]
    }
}
