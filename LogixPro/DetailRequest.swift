//
//  DetailRequest.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct DetailRequest: View {
    @State private var selectedSection: Int = 0
    
    var body: some View {
        VStack {
            SegmentedControl(
                $selectedSection,
                options: ["Changes", "History", "Repository"],
                prominent: true
            )
            .frame(maxWidth: .infinity)
            .frame(height: 26)
            .padding(.top, 4)
            
            Divider()
            
            Spacer()
        }
    }
}

#Preview {
    DetailRequest()
}
