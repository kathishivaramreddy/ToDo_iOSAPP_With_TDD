//
//  ToDoItem.swift
//  ToDo
//
//  Created by apple on 8/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.location?.name != rhs.location?.name ? false : true
    }
    
    
    let title:String
    let itemDescription: String?
    let timeStamp: Double?
    let location: Location?
    
    init(title: String, itemDescription: String? = nil, timeStamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timeStamp = timeStamp
        self.location = location
    }
}


