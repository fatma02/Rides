//
//  RidesApp.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI
import UIKit

// The main entry point of the Rides application.
@main
struct RidesApp: App {
    // The body property defines the main scene of the application.
    var body: some Scene {
        WindowGroup {
            // The initial view of the app, displaying the list of vehicles.
            VehicleListView(viewModel: VehicleListViewModel()) // Pass a new instance of VehicleListViewModel to the VehicleListView.
        }
    }
}
