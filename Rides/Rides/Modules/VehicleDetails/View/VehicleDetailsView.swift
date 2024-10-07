//
//  VehicleDetailsView.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct VehicleDetailsView: View {

    @StateObject var viewModel: VehicleDetailsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.selectedVehicle.makeModel)
                .font(.largeTitle)
                .foregroundStyle(Color.accentColor)
            Text(viewModel.selectedVehicle.vin)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(viewModel.selectedVehicle.color)
                .font(.footnote)
            Text(viewModel.selectedVehicle.carType)
                .font(.body)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}
