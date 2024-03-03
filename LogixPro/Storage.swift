//
//  Storage.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 03.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import Foundation

var store = Storage()

class Storage: ObservableObject {

    //public static var limit: NSNumber? = nil
    //public static var defaultFilter: String? = nil
    
    @Published var requests: [RequestModel] = []
    //var analitics: [AnalyticsModel] = []
    
    func saveRequest(request: RequestModel?){
        guard request != nil else {
            return
        }
        
        if let index = requests.firstIndex(where: { (req) -> Bool in
            return request?.id == req.id ? true : false
        }){
            requests[index] = request!
        }else{
            requests.insert(request!, at: 0)
        }

        //if let limit = Self.limit?.intValue {
        //    requests = Array(requests.prefix(limit))
        //}
        //NotificationCenter.default.post(name: newRequestNotification, object: nil)
    }
    
//    func saveAnalitics(event: AnalyticsModel?) {
//        guard let event = event else { return }
//        analitics.insert(event, at: 0)
//        
//        if let limit = Self.limit?.intValue {
//            analitics = Array(analitics.prefix(limit))
//        }
//        NotificationCenter.default.post(name: newAnaliticsNotification, object: nil)
//    }

    func clearData() {
        requests.removeAll()
//        analitics.removeAll()
    }
}
