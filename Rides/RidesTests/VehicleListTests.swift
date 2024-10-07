//
//  VehicleListTests.swift
//  RidesTests
//
//  Created by Fatma Fitouri on 6/10/2024.
//

import XCTest
@testable import Rides

final class VehicleListTests: XCTestCase {
    var viewModel: VehicleListViewModel?

    override func setUp() {
        super.setUp()
        viewModel = VehicleListViewModel()
    }

    func testDifferentSizes() {
        XCTAssertEqual(testVehicleListSize(size: 100), true)
        XCTAssertEqual(testVehicleListSize(size: 0), false)
        XCTAssertEqual(testVehicleListSize(size: 1), true)
        XCTAssertEqual(testVehicleListSize(size: 101), false)
    }

    func testVehicleListSize(size: Int) -> Bool {
        viewModel?.size = size
        do {
            try viewModel?.performVehiclesSearch()
            return true
        } catch let error {
            return !(error as? SearchError == SearchError.numNotInRange)
        }
    }
}
