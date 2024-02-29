//
//  FileHandler.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

class FileHandler: NSObject {

    static func writeTxtFile(text: String, path: String){
        FileManager.default.createFile(atPath: path, contents: text.data(using: .utf8, allowLossyConversion: true), attributes: nil)
    }
    
    static func writeTxtFileOnDesktop(text: String, fileName: String){
        let homeUser = NSString(string: "~").expandingTildeInPath.split(separator: "/").dropFirst().first ?? "-"
        let path = "Users/\(homeUser)/Desktop/\(fileName)"
        writeTxtFile(text: text, path: path)
    }
}
