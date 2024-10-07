//
//  DetailsView.swift
//  Rides
//
//  Created by Fatma Fitouri on 6/10/2024.
//

import SwiftUI

// View that displays detailed information about a selected vehicle.
struct DetailsView: View {

    let makeModel: String // makeModel for the selected vehicle.
    let vin: String // vin for the selected vehicle.
    let color: String // color for the selected vehicle.
    let carType: String // carType for the selected vehicle.

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(makeModel)
                .font(.largeTitle)
                .foregroundStyle(Color.accentColor)
            Text(vin)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(color)
                .font(.footnote)
            Text(carType)
                .font(.body)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}
