//
//  ViewController.swift
//  API Calling
//
//  Created by Andrew Coon on 2/4/20.
//  Copyright © 2020 Andrew Coon. All rights reserved.
//

import UIKit

class BreedsViewController: UITableViewController {
    
    var breeds = [[String: String]]()
    let apiKey = "35e67057-b80d-47df-aa43-98708e63f97d"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cat breeds"
        let query = "https://api.thecatapi.com/v1/images/search\(apiKey)"
    }


}

