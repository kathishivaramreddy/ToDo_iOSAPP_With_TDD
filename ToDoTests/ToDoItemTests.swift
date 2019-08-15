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
    
}
