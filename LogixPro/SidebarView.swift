//
//  SidebarView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    
    @State private var selectedApp: AppSection? = nil
    
    var body: some View {
        List(selection: $selectedApp) {
            Section("Favorites") {
                ForEach(AppSection.appMock()) { selection in
                    if case .app(let name, let image) = selection {
                        Label(name, systemImage: image)
                            .tag(selection)
                    }
                }
            }
            
            Section("All") {
                ForEach(AppSection.homeMock()) { selection in
                    if case .home(let name, let image) = selection {
                        Label(name, systemImage: image)
                            .tag(selection)
                    }
                }
            }
        }
        .frame(minWidth: 200)
        
    }
}

#Preview {
    SidebarView()
        .listStyle(.sidebar)
}
