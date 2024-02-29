//
//  WhBundle.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//
import UIKit

class LogixBundle: Bundle {
    static func getBundle() -> Bundle{
        let podBundle = Bundle(for: Logix.classForCoder())
        if let bundleURL = podBundle.url(forResource: "Logix", withExtension: "bundle"){
            if let bundle = Bundle(url: bundleURL) {
                return bundle
            }
        }
        
        return Bundle(for: Logix.classForCoder())
    }
}
