//
//  VehicleDetailsViewModel.swift
//  Rides
//
//  Created by Fatma Fitouri on 5/10/2024.
//

import Foundation

final class VehicleDetailsViewModel: ObservableObject {
    let selectedVehicle: Vehicle
    init(selectedVehicle: Vehicle) {
        self.selectedVehicle = selectedVehicle
    }
}
