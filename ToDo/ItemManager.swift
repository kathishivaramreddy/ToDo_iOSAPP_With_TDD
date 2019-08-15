//
//  ItemManager.swift
//  ToDo
//
//  Created by apple on 8/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import Foundation

struct ItemManager {
    
    var toDoCount = 0
    var doneCount = 0
    
    private var toDoItem = [ToDoItem]()
    
    mutating func add(_ item: ToDoItem) {
        toDoCount += 1
        toDoItem.append(item)
    }
    
    func item(at index: Int) -> ToDoItem{
        
        return toDoItem[index]
    }
    
}
