//
//  ViewController.swift
//  Demo_CategoryScreen
//
//  Created by Rohan Ghevariya on 2022-01-22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table:UITableView!
    
    var categories=["business","home","fitness"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate=self
        table.dataSource=self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=categories[indexPath.row]
        cell.textLabel?.font=UIFont(name: "Arial", size: 22)
        return cell
    }
    
    // Edit and Delete category
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            categories.remove(at: indexPath.row)
            table.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {

                    if (indexPath.row == 0)||(indexPath.row == 2) {
                        return true
                    }
                }
                return false
    }
   
    @IBAction func editAction(_ sender: UIBarButtonItem) {
    
    }
}

