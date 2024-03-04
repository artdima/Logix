//
//  PhoneView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 04.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct PhoneView: View {
    var phone: PhoneSection
    var body: some View {
        HStack {
            Image(systemName: "iphone")
                .resizable()
                .frame(width: 13, height: 20)
            Text(phone.name ?? "")
                .font(.title3)
            Spacer()
            Text(phone.iosVersion ?? "")
            Image(systemName: "personalhotspot.circle")
                .font(.title3)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    PhoneView(phone: PhoneSection(name: "iPhone 15 Pro Max",
                                  iosVersion: "iOS 17.2"))
}
