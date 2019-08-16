//
//  ItemManager.swift
//  ToDo
//
//  Created by apple on 8/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import Foundation

struct ItemManager {
    
    var toDoCount: Int { return toDoItem.count }
    var doneCount: Int {return doneToDoItem.count}
    
    private var toDoItem = [ToDoItem]()
    private var doneToDoItem = [ToDoItem]()
    
    mutating func add(_ item: ToDoItem) {
        if !toDoItem.contains(item) {
            toDoItem.append(item)
        }
        
    }
    
    func item(at index: Int) -> ToDoItem {
        
        return toDoItem[index]
    }
    
    mutating func checkItem(at index: Int) {
        let doneItem = toDoItem.remove(at: index)
        doneToDoItem.append(doneItem)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneToDoItem[index]
    }
    
    mutating func removeAll() {
        toDoItem.removeAll()
        doneToDoItem.removeAll()
    }
}
