//
//  Utils.swift
//  LogixDemo
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func random(max maxNumber: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxNumber)))
    }
    
    static func random(_ maxLenght: Int) -> String{
        let pswdChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 ")
        let rndPswd = String((0..<maxLenght).map{ _ in pswdChars[Int(arc4random_uniform(UInt32(pswdChars.count)))]})
        return rndPswd
    }
}
