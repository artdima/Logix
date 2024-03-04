//
//  RequestListView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct RequestListView: View {
    
    @StateObject var storage = store
    @State private var selection: RequestModel.ID? = nil
    
    var body: some View {
        VSplitView {
            Table(storage.requests, selection: $selection) {
                TableColumn(" ") { request in
                    if request.code == 200 {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                .width(20)
                TableColumn("Code", value: \.code.description)
                    .width(40)
                TableColumn("Method", value: \.method)
                    .width(50)
                TableColumn("URL", value: \.url)
                TableColumn("Date", value: \.date.description)
            }
            
            let request = storage.requests.first(where: { $0.id == selection })
            DetailRequest(selectedRequest: request)
                .frame(height: 400)
//                .frame(maxWidth: .infinity)
//                .frame(minHeight: screenSize.height / 10)
//                .frame(idealHeight: screenSize.height / 2)
//                .frame(maxHeight: screenSize.height / 1.5)
        }
        .listStyle(.plain)
        .navigationTitle("Project name")
        .navigationSubtitle("Request 500")
    }
    
    var screenSize: CGSize = {
        guard let size = NSScreen.main?.visibleFrame.size else { return .zero }
        return size
    }()
}

#Preview {
    RequestListView()
}
