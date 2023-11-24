//
//  GABLEManagerTests.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 11/24/23.
//

import XCTest

protocol GABLEManagerDelegate {
    func connect()
}

public class GABLEManager: GABLEManagerDelegate {
    var isConnected = false
    
    func connect() {
        // Implementation
    }
}

class MockGABLEManager: GABLEManagerDelegate {
    var isConnected = false
    
    func connect() {
        isConnected = true
    }
}

final class GABLEManagerTests: XCTestCase {
    var gaBLEManager: MockGABLEManager!
    
    override func setUp() {
        super.setUp()
        gaBLEManager = MockGABLEManager()
    }
    
    override func tearDown() {
        gaBLEManager = nil
        super.tearDown()
    }
    
    func testConnect() {
        gaBLEManager.connect()
        
        XCTAssertTrue(gaBLEManager.isConnected)
    }


}
