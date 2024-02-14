//
//  GABLECentralManagerProtocol.swift
//  GABLEManager
//
//  Created by Greg Alton on 2/14/24.
//

import CoreBluetooth

protocol GABLECentralManagerProtocol {
    var delegate: CBCentralManagerDelegate? { get set }
    func scanForPeripherals(withServices serviceUUIDs: [CBUUID]?, options: [String: Any]?)
    func stopScan()
    func connect(_ peripheral: CBPeripheral, options: [String: Any]?)
}

