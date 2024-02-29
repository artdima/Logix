//
//  CustomActivity.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

class CustomActivity: UIActivity {
    
    override var activityTitle: String?{
        return _activityTitle
    }
    override var activityImage: UIImage?{
        return _activityImage
    }
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: "com.Logix.Logix-iOS")
    }
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    var _activityTitle: String?
    var _activityImage: UIImage?
    var activityItems = [Any]()
    var action: ([Any]) -> Void
    
    init(title: String, image: UIImage?, performAction: @escaping ([Any]) -> Void) {
        _activityTitle = title
        _activityImage = image
        action = performAction
        super.init()
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    override func perform() {
        action(activityItems)
        activityDidFinish(true)
    }
}
