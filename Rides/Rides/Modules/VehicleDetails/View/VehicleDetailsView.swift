//
//  VehicleDetailsView.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct VehicleDetailsView: View {

    // StateObject to observe and manage the VehicleDetailsViewModel.
    @StateObject var viewModel: VehicleDetailsViewModel

    var body: some View {
        // A TabView to display multiple views, with paging-style navigation.
        TabView {
            // The first tab shows detailed information about the selected vehicle.
            DetailsView(makeModel: viewModel.selectedVehicle.makeModel,
                        vin: viewModel.selectedVehicle.vin,
                        color: viewModel.selectedVehicle.color,
                        carType: viewModel.selectedVehicle.carType)
            // The second tab shows the estimated carbon emission for the selected vehicle.
            EstimatedCarbonEmissionView(estimatedNumber: viewModel.estimatedCarbonEmission)
        }
        // Use a page-style TabView, which shows dots to indicate the number of pages.
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}
