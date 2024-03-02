//
//  MainCommands.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI
//import Sparkle //TODO: - Либа для обновления приложения

struct MainCommands: Commands {
    @Environment(\.openWindow)
    var openWindow

    var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            Button("About LogixPro") {
                //openWindow(id: SceneID.about.rawValue)
            }

            Button("Check for updates...") {
                //NSApp.sendAction(#selector(SPUStandardUpdaterController.checkForUpdates(_:)), to: nil, from: nil)
            }
        }

        CommandGroup(replacing: .appSettings) {
            Button("Settings...") {
                //openWindow(id: "settings")
            }
            .keyboardShortcut(",")
        }
    }
}

