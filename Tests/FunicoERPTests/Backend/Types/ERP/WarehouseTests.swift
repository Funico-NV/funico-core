//
//  WarehouseTests.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 09/03/2026.
//

import Testing
@testable import FunicoERP

struct WarehouseTests {
    
    @Test("Initialize 'DEM'")
    func initialize_DEM() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "DEM")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .DEM)
        #expect(warehouse.title == "DEM")
    }
    
    @Test("Initialize 'FUN'")
    func initialize_FUN() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "FUN")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .FUN)
        #expect(warehouse.title == "FUN")
    }
    
    @Test("Initialize 'K000525'")
    func initialize_K000525() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "K000525")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .customer("000525", warehouse: "K000525"))
        #expect(warehouse.title == "K000525")
    }
    
    @Test("Initialize 'RETOURDEM'")
    func initialize_RETOURDEM() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "RETOURDEM")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .returns("RETOURDEM", warehouse: "RETOURDEM"))
        #expect(warehouse.title == "RETOURDEM")
    }
    
    @Test("Initialize 'BOURG-STEP'")
    func initialize_BOURGSTEP() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "BOURG-STEP")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .transit("BOURG-STEP", warehouse: "BOURG-STEP"))
        #expect(warehouse.title == "BOURG-STEP")
    }
    
    @Test("Initialize 'QDEM'")
    func initialize_QDEM() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "QDEM")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .quarantine("QDEM", warehouse: "QDEM"))
        #expect(warehouse.title == "QDEM")
    }
    
    @Test("Initialize 'TZDEM'")
    func initialize_TZDEM() throws {
        let warehouse: Warehouse = try Warehouse(erpCode: "TZDEM")
        
        let warehouseId = warehouse.id
        let warehouseFromId = try Warehouse(id: warehouseId)
        
        #expect(warehouseFromId == warehouse)
        #expect(warehouse == .name(warehouse: "TZDEM"))
        #expect(warehouse.title == "TZDEM")
    }
}
