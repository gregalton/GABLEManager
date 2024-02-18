//
//  GABLECentralManagerWrapper.swift
//  GABLEManager
//
//  Created by Greg Alton on 2/16/24.
//
//This class wraps the CoreBluetooth interface, CBCentralManager with the GABLECentralManagerProtocol. This allows us to inject the actual CBCentralManager for production, and the GABLECentralManagerSpy for tests.
//
//Using Dependency Inversion (the D in SOLID) through a protocol in this way moves a dependency outside a class to enable more modular and testable design.

//Subcalssing in Objective-C and extension through protocols in Swift are two different architectures tht implement the Liskov Substitue Principle in SOLID. "In an object-oriented program, if we substitute a superclass object reference with an object of any of its subclasses, the program should not break."
import Foundation
import CoreBluetooth

class GABLECentralManagerWrapper: GABLECentralManagerProtocol {
//    The compiler accepts the type GABLECentralManagerProtocol for CBCentralManager and CBCentralManager as GABLECentralManagerProtocol because they both implement the methods and properties in the protocol.
//    
//    There is also an explicit conformance to the protocol in the class definition. The wrapper intercepts the calls to the methods and properties in the protocol and passes them to the production manager or the spy manager, depending on which was injected.
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

    func connect(_ peripheral: GABLEPeripheralProtocol, options: [String: Any]?) {
        centralManager.connect(peripheral, options: options)
    }
}


