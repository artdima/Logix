//
//  RequestCell.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

class RequestCell: UICollectionViewCell {
    
    @IBOutlet weak var methodLabel: LogixLabel!
    @IBOutlet weak var codeLabel: LogixLabel!
    @IBOutlet weak var urlLabel: LogixLabel!
    @IBOutlet weak var durationLabel: LogixLabel!
    
    func populate(request: RequestModel?){
        guard request != nil else {
            return
        }
        
        methodLabel.text = request?.method.uppercased()
        codeLabel.isHidden = request?.code == 0 ? true : false
        codeLabel.text = request?.code != nil ? String(request!.code) : "-"
        if let code = request?.code{
            var color: UIColor = Colors.HTTPCode.Generic
            switch code {
            case 200..<300:
                color = Colors.HTTPCode.Success
            case 300..<400:
                color = Colors.HTTPCode.Redirect
            case 400..<500:
                color = Colors.HTTPCode.ClientError
            case 500..<600:
                color = Colors.HTTPCode.ServerError
            default:
                color = Colors.HTTPCode.Generic
            }
            codeLabel.borderColor = color
            codeLabel.textColor = color
        }
        else{
            codeLabel.borderColor = Colors.HTTPCode.Generic
            codeLabel.textColor = Colors.HTTPCode.Generic
        }
        urlLabel.text = request?.url
        durationLabel.text = request?.duration?.formattedMilliseconds() ?? ""
    }
}
