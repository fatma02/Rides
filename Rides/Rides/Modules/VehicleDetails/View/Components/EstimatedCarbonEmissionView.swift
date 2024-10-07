//
//  EstimatedCarbonEmissionView.swift
//  Rides
//
//  Created by Fatma Fitouri on 6/10/2024.
//

import SwiftUI

// View that displays the estimated carbon emissions for a vehicle.
struct EstimatedCarbonEmissionView: View {

    // The estimated carbon emission value to be displayed.
    let estimatedNumber: Double

    var body: some View {
        VStack {
            Text("Estimated Carbon Emissions:")
                .font(.largeTitle)
                .foregroundStyle(Color.accentColor)
                .frame(alignment: .leading)
            Text(String(format: "%.1f", estimatedNumber))
                .font(.headline)
                .frame(alignment: .center)
                .bold()
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}
