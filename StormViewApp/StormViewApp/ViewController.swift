//
//  ViewController.swift
//  StormViewApp
//
//  Created by Anderson Sales on 19/10/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("jpg"){
                //this is a picture to load!
                pictures.append(item)
            }
        }
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //"Picture" is the name given to the tableview - check "document outline"
        //An alternative would be to register a new tableview with another identifier, cell, for example -> (line 27)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "detailScreen") as? DetailViewController {
            detailVC.image = pictures[indexPath.row]
            navigationController?.pushViewController(detailVC , animated: true)
        }
    }
}

