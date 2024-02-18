//
//  GABLECentralManagerSpy.swift
//  GABLEManagerTests
//
//  Created by Greg Alton on 2/16/24.
//

import Foundation
import CoreBluetooth
import GABLEManager

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
    
    func connect(_ peripheral: GABLEPeripheralProtocol, options: [String: Any]?) {
        didCallConnect = true
        connectPeripheral = peripheral as? CBPeripheral
    }
}

//Extension of CBPeripheral is required to allow conformance to GABLEPeripheralProtocol so that both CBPeripheral and GABLEMockPeripheral can be injected into the connect method. CBPeripheral has a private init and can't be mocked directly.
extension CBPeripheral: GABLEPeripheralProtocol {}

