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
        let (spy, manager) = makeSUT()
        
        manager.scanForPeripherals(withServices: nil, options: nil)
        
        XCTAssertTrue(spy.didCallScanForPeripherals)
    }
    
    func testWrapperCallsStopScanOnManager() {
        let (spy, manager) = makeSUT()
        
        manager.stopScan()
        
        XCTAssertTrue(spy.didCallStopScan)
    }
    
    func testWrapperCallsConnectOnManager() {
        let (spy, manager) = makeSUT()
        
        manager.connect(GABLEMockPeripheral(name: "MockPeripheral"), options: nil)
        
        XCTAssertTrue(spy.didCallConnect)
    }
    
    private func makeSUT() -> (GABLECentralManagerSpy, GABLECentralManagerWrapper) {
        let spy = GABLECentralManagerSpy()
        let manager = GABLECentralManagerWrapper(centralManager: spy)
        return (spy, manager)
    }
    
}
