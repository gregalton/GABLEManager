//
//  GABLEManagerTests.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 11/24/23.
//

import XCTest

protocol GABLEManagerDelegate {
    
}

public class GABLEManager: GABLEManagerDelegate {
    
}

class MockGABLEManager: GABLEManagerDelegate {
    
}

final class GABLEManagerTests: XCTestCase {
    var gaBLEManager: GABLEManagerDelegate!
    
    override func setUp() {
        super.setUp()
        gaBLEManager = MockGABLEManager()
    }
    
    override func tearDown() {
        gaBLEManager = nil
        super.tearDown()
    }
    
    


}
