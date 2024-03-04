//
//  PhoneView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 04.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct PhoneView: View {
    var body: some View {
        HStack {
            Image(systemName: "iphone")
                .resizable()
                .frame(width: 13, height: 20)
            Text("iPhone 14 Pro")
                .font(.title3)
            Spacer()
            Text("iOS 17.0")
            Image(systemName: "personalhotspot.circle")
                .font(.title3)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    PhoneView()
}
