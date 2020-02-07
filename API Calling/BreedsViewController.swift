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
        let query = "https://api.thecatapi.com/v1/breeds?attach_breed=0\(apiKey)"
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            if let url = URL(string: query) {
                if let data = try? Data(contentsOf: url) {
                    let json = try! JSON(data: data)
                    if json["status"] == "ok" {
                        self.parse(json: json)
                        return
                    }
                }
            }
            self.loadError()
        }
    }
    
    func parse (json: JSON) {
        for result in json["breeds"].arrayValue {
            let id = result["id"].stringValue
            let name = result["name"].stringValue
            let description = result["description"].stringValue
            let breed = ["id": id, "name": name, "description": description]
            breeds.append(breed)
        }
        DispatchQueue.main.async {
            [unowned self] in
            
            self.tableView.reloadData()
        }
    }
    
    func loadError() {
    let alert = UIAlertController(title: "Loading Error",
                                message: "There was a problem loading the news feed",
                         preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
    }
}

