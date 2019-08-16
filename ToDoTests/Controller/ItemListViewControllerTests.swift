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
    var mockTableView: MockTableView!

    override func setUp() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as? ItemListViewController
        sut.itemManager = ItemManager()
        mockTableView = MockTableView(
            frame: CGRect(x: 0, y:0, width: 320, height: 480),
            style: .plain)

        mockTableView.dataSource = sut
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
    
    func test_NumberOfSections_IsTwo() {
        
        XCTAssertEqual(sut.tableView.numberOfSections,2)
        
    }
    
    func test_NumberOfRowsInFirstSection_EqualToToDoItems() {
        
        sut.itemManager?.add(ToDoItem(title: "item"))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.add(ToDoItem(title: "item1"))
        sut.tableView.reloadData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
        
    }
    
    func test_NumberOfRowsInSecondSection_EqualToCheckedItems() {
        
        sut.itemManager?.add(ToDoItem(title: "item"))
        sut.itemManager?.add(ToDoItem(title: "item1"))
        sut.itemManager?.add(ToDoItem(title: "item2"))
        sut.itemManager?.checkItem(at: 0)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 1), 1)
        
    }
    
    func test_CellForRowAt_ShouldReturnItemCell() {
        
        sut.itemManager?.add(ToDoItem(title: "item"))
        sut.tableView.reloadData()
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
        
    }
    
    func test_TableView_IsAbleToDequeCell() {
        
        
        mockTableView.register(ItemCell.self,
                               forCellReuseIdentifier: "ItemCell")
        
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        
        mockTableView.reloadData()
        mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.deQueueCell)
    }
    
    func test_CellForRow_ConfigsCell() {
        
        mockTableView.register(MockItemCell.self , forCellReuseIdentifier: "ItemCell")
        let item = ToDoItem(title: "Foo")
        sut.itemManager?.add(item)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        XCTAssertTrue(cell.configCellGotCalled)
        
    }
    
    func test_cellForRowSection2_CallConfigCell_DoneItems() {
        
        mockTableView.register(MockItemCell.self , forCellReuseIdentifier: "ItemCell")
        let item = ToDoItem(title: "Foo")
        let item2 = ToDoItem(title: "Foo2")
        sut.itemManager?.add(item)
        sut.itemManager?.add(item2)
        sut.itemManager?.checkItem(at: 1)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell
        XCTAssertTrue(cell.configCellGotCalled)
        
    }

}

extension ItemListViewControllerTests {
    
    class MockTableView: UITableView {
        
        var deQueueCell = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            deQueueCell = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockItemCell: ItemCell {
        
        var configCellGotCalled = false
        
        override func configCell(with item: ToDoItem) {
            configCellGotCalled = true
        }
    }
    
}
