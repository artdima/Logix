//
//  HeaderRequestDetailView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 05.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct HeaderRequestDetailView: View {
    var body: some View {
        HStack {
            ZStack {
                Text("POST")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.horizontal, 12)
            }.background(.brown)
                .cornerRadius(10)
                .frame(height: 20)
            
            ZStack {
                Text("200 OK")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.horizontal, 12)
            }.background(.green)
                .cornerRadius(10)
                .frame(height: 20)
            
            Text("https://review-f-team-admin-review.growfood.pro/api/mobile-apps/v2_23/orders")
            
            Spacer()
            
            Button {
                //TODO: -
            } label: {
                Image(systemName: "xmark")
            }
            .buttonStyle(.accessoryBar)
        }
        .frame(height: 26)
        .padding(.horizontal, 12)
        .padding(.top, 6)
    }
}

#Preview {
    HeaderRequestDetailView()
}
