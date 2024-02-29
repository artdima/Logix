//
//  AnalyticsDetailViewController.swift
//  Logix-iOS
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

import UIKit

class AnalyticsDetailViewController: LogixBaseViewController {
    
    @IBOutlet private var titleLable: UILabel!
    @IBOutlet private var bodyLable: UILabel!
    
    var analytics: AnalyticsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Analytics details"
        
        titleLable.text = analytics?.name
        
        var textBody = ""
        if let parameters = analytics?.parameters {
            parameters.forEach { (key: String, value: Any) in
                textBody += key + ": " + String(describing: value) + "\n"
            }
        }
        bodyLable.text = textBody
        
        //let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openActionSheet(_:)))
        //navigationItem.rightBarButtonItems = [shareButton]
    }
    
    
    // MARK: - Actions
//    @objc func openActionSheet(_ sender: UIBarButtonItem){
//        let ac = UIAlertController(title: "Logix", message: "Choose an option", preferredStyle: .actionSheet)
//
//        ac.addAction(UIAlertAction(title: "Share", style: .default) { [weak self] (action) in
//            self?.shareContent(sender)
//        })
//        ac.addAction(UIAlertAction(title: "Share (request as cURL)", style: .default) { [weak self] (action) in
//            self?.shareContent(sender, requestExportOption: .curl)
//        })
//        ac.addAction(UIAlertAction(title: "Share as Postman Collection", style: .default) { [weak self] (action) in
//            self?.shareContent(sender, requestExportOption: .postman)
//        })
//        ac.addAction(UIAlertAction(title: "Close", style: .cancel) { (action) in
//        })
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            ac.popoverPresentationController?.barButtonItem = sender
//        }
//        present(ac, animated: true, completion: nil)
//    }
    
//    func shareContent(_ sender: UIBarButtonItem, requestExportOption: RequestResponseExportOption = .flat){
//        if let analitics = analitics {
//            ShareUtils.shareRequests(presentingViewController: self, sender: sender, requests: [analitics], requestExportOption: requestExportOption)
//        }
//    }
}
