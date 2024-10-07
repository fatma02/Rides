//
//  VehicleDetailsTests.swift
//  RidesTests
//
//  Created by Fatma Fitouri on 6/10/2024.
//

import XCTest
@testable import Rides

final class VehicleDetailsTests: XCTestCase {

    func testKilometrage() {
        XCTAssertEqual(calculEstimatedCarbon(for: 5000), 5000)
        XCTAssertEqual(calculEstimatedCarbon(for: 10000), 12500)
    }

    func calculEstimatedCarbon(for km: Double) -> Double {
        let viewModel = VehicleDetailsViewModel(selectedVehicle: Vehicle(id: 1234, vin: "123456", makeModel: "BMW", color: "gold", carType: "sport", kilometrage: km))
        return viewModel.estimatedCarbonEmission
    }
}
