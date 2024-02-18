//
//  GABLEMockPeripheral.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 2/17/24.
//

import Foundation

class GABLEMockPeripheral: GABLEPeripheralProtocol {
    var name: String?
    
    init(name: String?) {
        self.name = name
    }
}
