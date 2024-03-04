//
//  ApplicationView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 04.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct ApplicationView: View {
    var body: some View {
        HStack {
            Image("icon")
                .resizable()
                .frame(width: 22, height: 22)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 3))
            VStack(alignment: .leading) {
                Text("Grow Food")
                Text("com.github.growfood.ios")
                    .foregroundColor(Color(.tertiaryLabelColor))
                    .font(.caption2)
                    
            }
        }
        
    }
}

#Preview {
    ApplicationView()
}
