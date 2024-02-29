//
//  Section.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

struct Section {
    var name: String
    var type: SectionType
    
    init(name: String, type: SectionType) {
        self.name = name
        self.type = type
    }
}

enum SectionType {
    case overview
    case requestHeader
    case requestBody
    case responseHeader
    case responseBody
}

enum LogType {
    case network
    case analitics
}
