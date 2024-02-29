//
//  AnaliticsCell.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

class AnaliticsCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: LogixLabel!
    @IBOutlet weak var paramLabel: LogixLabel!

    func populate(event: AnalyticsModel?){
        guard let event = event else { return }
        
        nameLabel.text = event.name
        paramLabel.text = event.parameters?.description
    }

}
