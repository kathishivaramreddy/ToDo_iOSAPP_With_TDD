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

}
