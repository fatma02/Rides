//
//  VehicleListView.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct VehicleListView: View {

    @StateObject var viewModel: VehicleListViewModel

    var body: some View {
        NavigationStack {
            HStack {
                CustomSearchBar(size: $viewModel.size) {
                    self.viewModel.performVehiclesSearch()
                    hideKeyboard()
                } menuItemSelected: { item in
                    viewModel.sortItem = item
                }
            }

            List {
                ForEach(viewModel.vehicles, id: \.id) { item in
                    NavigationLink(destination: VehicleDetailsView(viewModel: VehicleDetailsViewModel(selectedVehicle: item))) {
                        // Showing vin and car type depending on sort option to make it more clear how sort is working
                        VehicleItem(titleText: item.makeModel, subTitleText: viewModel.sortItem == .vin ? item.vin : item.carType)
                    }
                }
            }
        }
    }
}
