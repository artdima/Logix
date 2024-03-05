//
//  DetailHeaderView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 05.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct DetailHeaderView: View {
    var headers: [RequestModel.Header]
    
    var body: some View {
        Table(headers) {
            TableColumn("Name", value: \.name)
            TableColumn("Value") { header in
                if let desc = header.desc {
                    Text(desc)
                }
            }
        }
    }
}

#Preview {
    DetailHeaderView(headers: [RequestModel.Header(name: "Accept-Language", desc: "en"),
                               RequestModel.Header(name: "Content-Type", desc: "application/json"),
                               RequestModel.Header(name: "Accept", desc: "application/json")]
    )
}
