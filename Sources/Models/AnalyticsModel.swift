//
//  AnaliticsModel.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import Foundation
import UIKit

open class AnalyticsModel {
    public let date: Date
    public var name: String?
    public var parameters: [String: Any]?
    
    init(name: String?, parameters: [String: Any]?) {
        self.date = Date()
        self.name = name
        self.parameters = parameters
    }
}

