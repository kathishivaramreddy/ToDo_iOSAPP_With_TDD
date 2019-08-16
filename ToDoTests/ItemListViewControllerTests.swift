//
//  ItemListViewControllerTests.swift
//  ToDoTests
//
//  Created by apple on 8/16/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTests: XCTestCase {
    
    var sut: ItemListViewController!

    override func setUp() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as? ItemListViewController
        sut.loadViewIfNeeded()
    
    }

    override func tearDown() {
       
    }
    
    func test_ItemList_LoadsTableView() {
        
        XCTAssertNotNil(sut.tableView)
    
    }
    
    func test_LoadingView_SetsDataSource() {
        
        XCTAssertTrue(sut.tableView.dataSource is ItemListViewController)
        
    }
    
    func test_LoadingView_SetsDelegateSource() {
        
        XCTAssertTrue(sut.tableView.delegate is ItemListViewController)
    }

}
