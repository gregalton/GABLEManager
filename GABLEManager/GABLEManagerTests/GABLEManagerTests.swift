//
//  GABLEManagerTests.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 11/24/23.
//

import XCTest

protocol GABLEManagerDelegate {
    func connect()
    func disconnect()
}

public class GABLEManager: GABLEManagerDelegate {
    var isConnected = false
    
    func connect() {
        // Implementation
    }
    
    func disconnect() {
        // Implementation
    }
}

class MockGABLEManager: GABLEManagerDelegate {
    var isConnected = false
    
    func connect() {
        isConnected = true
    }
    
    func disconnect() {
        isConnected = false
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

    func testDisconnect() {
        gaBLEManager.disconnect()
        
        XCTAssertFalse(gaBLEManager.isConnected)
    }

}
