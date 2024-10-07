//
//  VehicleListView.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct VehicleListView: View {

    // StateObject to observe and manage the VehicleListViewModel.
    @StateObject var viewModel: VehicleListViewModel
    // State to manage error messages for showing toast notifications.
    @State private var errorMessage: String? = nil

    var body: some View {
        NavigationStack {
            // Custom search bar where the user can input a vehicle size for fetching. Also allows the selection of a sort option.
            CustomSearchBar(size: $viewModel.size) {
                do {
                    // Attempt to perform the vehicle search.
                    try self.viewModel.performVehiclesSearch()
                } catch(let e) {
                    // Show toast message if an error occurs during the search.
                    showToastMessage((e as? SearchError)?.localizedDescription ?? "Error")
                }
                // Hide the keyboard after search action is triggered.
                hideKeyboard()
            } menuItemSelected: { item in
                // Update the sort option when the user selects a different item from the menu.
                if viewModel.sortItem != item {
                    viewModel.sortItem = item
                }
            }

            // List to display fetched vehicle items.
            List {
                // Loop through the vehicle array and display each vehicle in a list item.
                ForEach(viewModel.vehicles, id: \.id) { item in
                    // NavigationLink to navigate to vehicle details when a list item is tapped.
                    NavigationLink(destination: VehicleDetailsView(viewModel: VehicleDetailsViewModel(selectedVehicle: item))) {
                        // VehicleItem view to display vehicle information.
                        // The subtitle displays either VIN or car type based on the selected sorting option.
                        VehicleItem(titleText: item.makeModel, subTitleText: viewModel.sortItem == .vin ? item.vin : item.carType)
                    }
                }
            }

            // Conditionally show a toast message at the bottom if an error occurs.
            if errorMessage != nil {
                ToastMessageView(message: errorMessage!)
                    .transition(.move(edge: .bottom)) // Animate the toast message appearance.
                    .zIndex(1) // Ensure the toast appears on top of other UI elements.
            }
        }
    }

    // Function to display a toast message with an error and hide it after 2 seconds.
    func showToastMessage(_ error: String) {
        errorMessage = error
        // Delay for 2 seconds, then set errorMessage to nil to dismiss the toast message.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            errorMessage = nil
        }
    }
}
