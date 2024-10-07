//
//  VehicleDetailsViewModel.swift
//  Rides
//
//  Created by Fatma Fitouri on 5/10/2024.
//

import Foundation
import UIKit

// ViewModel responsible for managing the details of a selected vehicle.
final class VehicleDetailsViewModel: ObservableObject {

    // The vehicle that has been selected to show its details.
    let selectedVehicle: Vehicle

    // Computed property that calculates the estimated carbon emission based on the vehicle's kilometrage.
    // If the kilometrage is less than or equal to 5000, the emission is the same as the kilometrage.
    // Otherwise, the emission is calculated with a factor of 1.5 after the first 5000 is travelled.
    var estimatedCarbonEmission: Double {
        return selectedVehicle.kilometrage <= 5000 ? selectedVehicle.kilometrage : (selectedVehicle.kilometrage*1.5 - 2500)
    }

    // Initializer that takes a Vehicle object as a parameter and sets up the UI appearance for page indicators.
    init(selectedVehicle: Vehicle) {
        self.selectedVehicle = selectedVehicle
        // Customize the appearance of the UIPageControl for pagination dots.
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.accent
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.accent.withAlphaComponent(0.4)
    }
}
