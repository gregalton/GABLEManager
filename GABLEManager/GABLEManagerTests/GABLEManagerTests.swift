//
//  GABLEManagerTests.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 11/24/23.
//

import XCTest
import CoreBluetooth
@testable import GABLEManager

final class GABLEManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWrapperCallsScanForPeripheralsOnManager() {
        let spy = GABLECentralManagerSpy()
        let manager = GABLECentralManagerWrapper(centralManager: GABLECentralManagerWrapper(centralManager: spy))
        
        manager.scanForPeripherals(withServices: nil, options: nil)
        
        XCTAssertTrue(spy.didCallScanForPeripherals)
    }
    
    func testWrapperCallsStopScanOnManager() {
        let spy = GABLECentralManagerSpy()
        let manager = GABLECentralManagerWrapper(centralManager: GABLECentralManagerWrapper(centralManager: spy))
        
        manager.stopScan()
        
        XCTAssertTrue(spy.didCallStopScan)
    }
    
}
