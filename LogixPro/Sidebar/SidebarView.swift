//
//  SidebarView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    
    @State private var selectedPhone: PhoneSection? = nil
    
    var body: some View {
        List(selection: $selectedPhone) {
            Section("Favorites") {
                ForEach(AppSection.appMock()) { selection in
                    ApplicationView()
                    
                    if case .app(_, _, let phones) = selection {
                        ForEach(phones) { selectionPhone in
                            PhoneView(phone: selectionPhone)
                                .padding(.leading)
                                .tag(selectionPhone)
                        }
                    }
                }
            }
//            Section("All") {
//                ForEach(AppSection.homeMock()) { selection in
//                    if case .home(let name, let image) = selection {
//                        Label(name, systemImage: image)
//                            .tag(selection)
//                    }
//                }
//            }
        }
        .frame(minWidth: 200)
        
    }
}

#Preview {
    SidebarView()
        .listStyle(.sidebar)
}
