//
//  ViewController.swift
//  RESTfulManager
//
//  Created by netas on 27.06.2016.
//  Copyright © 2016 netas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedGetRequestButton(sender: AnyObject) {
        LibraryAPI.sharedInstance.getPriorityList { (result) in
            switch result {
            case .Success(let data):
                print(data)
            case .Failure(let error):
                print(error.domain)
            }
        }
    }

}

