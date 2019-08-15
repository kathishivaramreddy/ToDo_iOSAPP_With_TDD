//
//  LocationTests.swift
//  ToDoTests
//
//  Created by apple on 8/15/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class LocationTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
       
    }
    
    func test_Init_SetsName() {
        let name = "name"
        let location = Location(name: name)
        XCTAssertEqual(location.name, name)
    }
    
    func test_Init_SetsCoordinate() {
        
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        
        XCTAssertEqual(coordinate.latitude, location.coordinate?.latitude)
        XCTAssertEqual(coordinate.longitude, location.coordinate?.longitude)
    }
    

}
