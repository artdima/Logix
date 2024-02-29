//
//  RequestResponseExportOption.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import Foundation

/// `RequestResponseExportOption` is the type used to handle different export representations of HTTP requests and responses collected by Logix.
enum RequestResponseExportOption {
    /// Export a request and its response in a "human" readable mode.
    case flat
    /// Request is exported as a cURL command; response is exported in a "human" readable mode.
    case curl
    /// Request and response are exported as Postman collection (v.2.1). Response is attached as "example".
    case postman
}
