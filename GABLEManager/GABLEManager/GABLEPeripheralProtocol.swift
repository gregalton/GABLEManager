//
//  GABLEPeripheralProtocol.swift
//  GABLEManager
//
//  Created by Greg Alton on 2/17/24.
//

import Foundation
import CoreBluetooth

//Using GABLEPeripheralProtocol to extend CBPeripheral in order to mock it, since it doesn't have a public initializer. CBCentralManager connect() requires a CBPeripheral.

protocol GABLEPeripheralProtocol {
    var name: String? { get }
}


