//
//  DetailRequest.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import SwiftUI

struct DetailRequest: View {
    @State private var selectedRequestSection: Int = 0
    @State private var selectedResponseSection: Int = 0
    
    var selectedRequest: RequestModel?
    
    var body: some View {
        VStack {
            HeaderRequestDetailView()
            Divider()
            HSplitView {
                request
                response
            }
        }
    }
    
    var request: some View {
        VStack {
            
            HeaderMenuDetailView(text: "Request", options: ["Header", "Body", "cURL"], selection: $selectedRequestSection)
            Divider()
            
            if let selectedRequest {
                switch selectedRequestSection {
                case 0: DetailHeaderView(headers: selectedRequest.headersArray)
                case 1: DetailJsonView(dataResponse: selectedRequest.httpBody)
                case 2: DetailCurlView(curl: selectedRequest.curlRequest)
                default: Text("Empty")
                }
            }
            Spacer()
        }
    }
    
    var response: some View {
        VStack {
            HeaderMenuDetailView(text: "Response", options: ["Header", "Body"], selection: $selectedResponseSection)
            Divider()
            if let selectedRequest {
                switch selectedResponseSection {
                case 0: DetailHeaderView(headers: selectedRequest.responseHeadersArray)
                case 1: DetailJsonView(dataResponse: selectedRequest.dataResponse)
                default:
                    Text("Empty")
                }
            }
            Spacer()
        }
    }
}

//#Preview {
//    DetailRequest(selectedRequest: Binding<RequestModel.ID?>)
//}
