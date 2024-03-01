//
//  ViewController.swift
//  LogixDemo
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import UIKit
import Logix

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { (timer) in
                DataFetcher.sharedInstance.getPost(id: Utils.random(max: 128), completion: {
                    print("API: Get post")
                }) { (error) in
                    print("ERROR: api Get post")
                }
                
                //TODO: -
                //Logix.saveEvents(name: "Name", parameters: ["Event": "Value \(timer)", "Event1": "Test 2", "Event3": "Test \(timer)"])
            }
            timer.fire()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    @IBAction func getPostsButtonPressed(_ sender: Any) {
        DataFetcher.sharedInstance.getPost(id: 1, completion: {
            print("API: Get post")
        }) { (error) in
            print("ERROR: api Get post")
        }
    }
    
    @IBAction func newRandomPostButtonPressed(_ sender: Any) {
        DataFetcher.sharedInstance.newPost(userId: Utils.random(max: 5000), title: Utils.random(128), body: Utils.random(5000), completion: {
            print("API: New post")
        }) { (error) in
            print("ERROR: api New post")
        }
    }
    
    @IBAction func getWrongURLButtonPressed(_ sender: Any) {
        DataFetcher.sharedInstance.getWrongURL( completion: {
            print("API: Wrong URL")
        }) { (error) in
            print("ERROR: api Wrong URL")
        }
    }

    @IBAction func getPhotosButtonPressed(_ sender: Any) {
        DataFetcher.sharedInstance.getPhotosList(completion: {
            print("API: Get photos")
        }) { (error) in
            print("ERROR: api Get photos")
        }
    }
}

