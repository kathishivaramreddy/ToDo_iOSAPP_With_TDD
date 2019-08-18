//
//  ItemListViewController.swift
//  ToDo
//
//  Created by apple on 8/16/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBOutlet weak var tableView: UITableView!
    var itemManager: ItemManager?
    
}


extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows: Int
        switch section {
        case 0:
            numberOfRows = itemManager?.toDoCount ?? 0
        case 1:
            numberOfRows = itemManager?.doneCount ?? 0
        default:
            numberOfRows = 0
        }
        return numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item: ToDoItem
        switch indexPath.section {
        case 0:
            item = (itemManager?.item(at: indexPath.row))!
        case 1:
            item = (itemManager?.item(at: indexPath.row))!
        default:
           item = ToDoItem(title: "not found")
        }
       
        itemCell.configCell(with: item)
        
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        let title: String
        switch indexPath.section {
        case 0:
            title = "Check"
        case 1:
            title = "UnCheck"
        default:
            title = " "
        }
        return title
    }
    
}
