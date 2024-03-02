//
//  MainContentView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var searchRequest: String = ""
    @State private var filter = FilterCategory.all
    @State private var inspectorIsShow: Bool = false
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } 
//        content: {
//            
//        } 
        detail: {
            RequestListView()
                .inspector(isPresented: $inspectorIsShow) {
                    Text("Show detail")
                }
        }
        .searchable(text: $searchRequest)
        .toolbar {
            ToolbarItemGroup {
                //ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        //Toggle(isOn: $showFavoritesOnly) {
                        //    Label("Favorites only", systemImage: "star.fill")
                        //}
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                
                Button {
                    inspectorIsShow.toggle()
                } label: {
                    Label("Show inspector", systemImage: "sidebar.right")
                }
                //}
            }
        }
        
    }
}

#Preview {
    MainContentView()
}
