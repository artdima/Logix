//
//  DetailJsonView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 04.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI
import JSONViewer

struct DetailJsonView: View {
    var dataResponse: Data?
    
    var body: some View {
        if let httpBodyData = dataResponse,
           let httpBody = String(data: httpBodyData, encoding: .utf8),
           let rootNode: JSONNode = httpBody.jsonNode() {
            
            JSONViewer(rootNode: rootNode)
        }
    }
}

#Preview {
    DetailJsonView()
}
