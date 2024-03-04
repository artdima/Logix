//
//  DetailCurlView.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 04.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct DetailCurlView: View {
    
    var curl: String?
    
    var body: some View {
        Text(curl ?? "")
    }
}

#Preview {
    DetailCurlView()
}
