//
//  ViewController.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 06/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {
    
    let dict: [String: Any] = [
        "person": [
            "name": "demo",
            "age": 20,
        ],
        "address": [
            "line1": "line 1 here",
            "pincode": 2500
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        parseCodableExample()
        
        //parseObjectMapperExample()
        
        //parseCustomMappableExample()
        
        //parseCustomMappableMixExample()
        
    }
}
