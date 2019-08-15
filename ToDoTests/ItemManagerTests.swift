//
//  ItemManagerTests.swift
//  ToDoTests
//
//  Created by apple on 8/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerTests: XCTestCase {

    var sut: ItemManager!
    
    override func setUp() {
        
        sut = ItemManager()
    }

    override func tearDown() {
        
    }
    
    func test_ToDoCount_InitiallyIsZero() {
        
        
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_DoneCount_InitiallyIsZero() {
        
        XCTAssertEqual(sut.doneCount, 0)
        
    }

    func test_AddItem_IncreasesToDoCount() {
        
        sut.add(ToDoItem(title: "item"))
        XCTAssertEqual(sut.toDoCount, 1)
        
    }
    
    func test_ItemAt_ReturnsAddedItem() {
        
        let item = ToDoItem(title: "item")
        sut.add(item)
        
        let returnedItem = sut.item(at: 0)
        XCTAssertEqual(item.title, returnedItem.title)
        
    }
    
    func test_checkItemAt_ChangesCount() {
        
        let item = ToDoItem(title: "item")
        sut.add(item)
        
        sut.checkItem(at: 0)
        XCTAssertEqual(sut.doneCount, 1)
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_checkItemAt_RemovesItemFromToDoItem() {
        
        let item1 = ToDoItem(title: "item1")
        let item2 = ToDoItem(title: "item2")
        sut.add(item1)
        sut.add(item2)
        
        sut.checkItem(at: 0)
        
        let returnedItem =  sut.item(at: 0)
        XCTAssertEqual(returnedItem.title, item2.title)
        
    }
    
    func test_doneItemAt_ReturnsCheckedItem() {
        
        let item = ToDoItem(title: "item")
        sut.add(item)
        
        sut.checkItem(at: 0)
        
        let doneItem = sut.doneItem(at:0)
        XCTAssertEqual(doneItem.title, item.title)
        
        
    }
    
    
}
