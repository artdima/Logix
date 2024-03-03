//
//  Logs.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 03.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import os.log

func log(_ message: String) {
    let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "MPLogging")
    os_log("%@", log: log, type: .debug, message)
}

