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
    func sendData(_ data: Data)
    func receivedData(_ data: Data) -> Data
}

public class GABLEManager: GABLEManagerDelegate {
    var isConnected = false
    
    func connect() {
        // Implementation
    }
    
    func disconnect() {
        // Implementation
    }
    
    func sendData(_ data: Data) {
        // Implementation
    }
    
    func receivedData(_ data: Data) -> Data {
        // Implementation
        return data
    }
}

class MockGABLEManager: GABLEManagerDelegate {
    var isConnected = false
    var sentData: Data?
    var receivedData: Data?
    
    func connect() {
        isConnected = true
    }
    
    func disconnect() {
        isConnected = false
    }
    
    func sendData(_ data: Data) {
        sentData = data
    }
    
    func receivedData(_ data: Data) -> Data {
        return data
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
    
    func testSendData() {
        let testData = "Test Data".data(using: .utf8)!
        gaBLEManager.sendData(testData)
        
        XCTAssertEqual(testData, gaBLEManager.sentData)
    }
    
    func testReceivedData() {
        let testData = "Test Received Data".data(using: .utf8)!
        let receivedData = gaBLEManager.receivedData(testData)
        
        XCTAssertEqual(testData, receivedData)
    }

}
