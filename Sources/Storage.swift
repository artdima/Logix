//
//  Storage.swift
//  Logix-SDK-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import Foundation

open class Storage: NSObject {

    public static let shared: Storage = Storage()
    public static var limit: NSNumber? = nil
    public static var defaultFilter: String? = nil
    
    open var requests: [RequestModel] = []
    open var analitics: [AnalyticsModel] = []
    
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

        if let limit = Self.limit?.intValue {
            requests = Array(requests.prefix(limit))
        }
        NotificationCenter.default.post(name: newRequestNotification, object: nil)
        
        guard let request else { return }
        server?.send(with: request)
    }
    
    func saveAnalitics(event: AnalyticsModel?) {
        guard let event = event else { return }
        analitics.insert(event, at: 0)
        
        if let limit = Self.limit?.intValue {
            analitics = Array(analitics.prefix(limit))
        }
        NotificationCenter.default.post(name: newAnaliticsNotification, object: nil)
    }

    func clearData() {
        requests.removeAll()
        analitics.removeAll()
    }
}
