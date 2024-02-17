//
//  GABLECentralManagerSpy.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 2/16/24.
//

import Foundation
import CoreBluetooth

class GABLECentralManagerSpy: GABLECentralManagerProtocol {
    var delegate: CBCentralManagerDelegate?
    var didCallScanForPeripherals = false
    var didCallStopScan = false
    var didCallConnect = false
    var connectPeripheral: CBPeripheral?
    
    func scanForPeripherals(withServices serviceUUIDs: [CBUUID]?, options: [String: Any]?) {
        didCallScanForPeripherals = true
    }
    
    func stopScan() {
        didCallStopScan = true
    }
    
    func connect(_ peripheral: CBPeripheral, options: [String: Any]?) {
        didCallConnect = true
        connectPeripheral = peripheral
    }
}

