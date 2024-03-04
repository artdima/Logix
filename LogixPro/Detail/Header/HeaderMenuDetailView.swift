//
//  HeaderMenuDetailView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 04.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct HeaderMenuDetailView: View {
    var text: String
    var options: [String]
    @Binding var selection: Int
    
    var body: some View {
        HStack {
            Text(text)
                .font(.title3)
                .bold()
                .padding(.top, 6)
            
            SegmentedControl(
                $selection,
                options: options,
                prominent: true
            )
            .frame(maxWidth: .infinity)
            .frame(height: 26)
            .padding(.top, 6)
        }
        .frame(height: 26)
        .padding(.leading)
    }
}

//#Preview {
//    HeaderMenuDetailView()
//}
