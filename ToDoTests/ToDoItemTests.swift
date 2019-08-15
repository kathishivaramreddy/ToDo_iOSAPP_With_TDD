//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by apple on 8/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "title")
        XCTAssertEqual(item.title, "title")
        
    }

    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "description")
        XCTAssertEqual(item.itemDescription, "description")
    }
    
    func test_Init_SetsTimeStamp() {
        let item = ToDoItem(title: "", timeStamp: 0.0)
        XCTAssertEqual(item.timeStamp, 0.0)
    }
    
    func test_Init_SetsLocation() {
        let location = Location(name: "location")
        let item = ToDoItem(title: "", location: location)
        XCTAssertEqual(item.location?.name, location.name)
    
    }
    
    func test_EqualItems_AreEqual() {
        
        let item1 = ToDoItem(title: "finish tdd")
        let item2 = ToDoItem(title: "finish tdd")
        
        XCTAssertEqual(item1, item2)
    }
    
    func test_Items_WhenLocationDiffers_AreNotEqual() {
        
        let item1 = ToDoItem(title: "finish tdd", location: Location(name: "one"))
        let item2 = ToDoItem(title: "finish tdd", location: Location(name: "two"))
        
        XCTAssertNotEqual(item1, item2)
        
    }
    
    func test_Items_WhenTimeStampDiffers_AreNotEqual() {
        
        let item1 = ToDoItem(title: "title", timeStamp: 0.0)
        let item2 = ToDoItem(title: "title", timeStamp: 1.0)
        
        XCTAssertNotEqual(item1, item2)
    }
    
    func test_Items_WhenDescriptionDiffers_AreNotEqual() {
        
        let item1 = ToDoItem(title: "title", itemDescription: "description1")
        let item2 = ToDoItem(title: "title", itemDescription: "description2")
        
        XCTAssertNotEqual(item1,item2)
        
    }
    
    func test_items_WhenTitleDiffers_AreNotEqual() {
        
        let item1 = ToDoItem(title: "title1")
        let item2 = ToDoItem(title: "title2")
        
        XCTAssertNotEqual(item1, item2)
        
    }

}
