//
//  HTTPValidation.swift
//  LogixDemo
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import Foundation

extension URLResponse{
    
    //Return error if the status code is not inside 200-299 range.
    func validate() -> Error?{
        let acceptableStatusCodes: Range<Int> = 200..<300
        
        let response = self as! HTTPURLResponse
        
        if !acceptableStatusCodes.contains(response.statusCode){
            
            let failureReason = "Response status code was unacceptable: \(response.statusCode)"
            
            let error = NSError(
                domain: domain,
                code: response.statusCode,
                userInfo: [
                    NSLocalizedFailureReasonErrorKey: failureReason,
                    "StatusCode": response.statusCode
                ]
            )
            return error
        }
        
        return nil
    }
}
