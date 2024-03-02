//
//  LogixProApp.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

@main
struct LogixProApp: App {
    var body: some Scene {
        WindowGroup {
            MainContentView()
                .preferredColorScheme(.dark)
        }
        .commands {
            LogixEditCommands()
        }
        
        //.windowToolbarStyle(.unified)
        
    }
}
