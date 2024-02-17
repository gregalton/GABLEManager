//
//  GABLECentralManagerWrapper.swift
//  GABLEManager
//
//  Created by Greg Alton on 2/16/24.
//
//  This class wraps the CoreBluetooth main interface, CBCentralManager with the
//  GABLECentralManagerProtocol. This allows us to inject the actual CBCentralManager for
//  production, and the GABLECentralManagerSpy for tests.
//
//  Using Dependency Inversion (the D in SOLID) through a protocol in this way moves a
//  dependency outside a class to enable more modular and testable design.

import Foundation
import CoreBluetooth

class GABLECentralManagerWrapper: GABLECentralManagerProtocol {
    private var centralManager: GABLECentralManagerProtocol

    init(centralManager: GABLECentralManagerProtocol) {
        self.centralManager = centralManager
    }

    var delegate: CBCentralManagerDelegate? {
        get { return centralManager.delegate }
        set { centralManager.delegate = newValue }
    }

    func scanForPeripherals(withServices serviceUUIDs: [CBUUID]?, options: [String: Any]?) {
        centralManager.scanForPeripherals(withServices: serviceUUIDs, options: options)
    }

    func stopScan() {
        centralManager.stopScan()
    }

    func connect(_ peripheral: CBPeripheral, options: [String: Any]?) {
        centralManager.connect(peripheral, options: options)
    }
}

