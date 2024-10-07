//
//  RidesApp.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

@main
struct RidesApp: App {
    var body: some Scene {
        WindowGroup {
            VehicleListView(viewModel: VehicleListViewModel())
        }
    }
}
