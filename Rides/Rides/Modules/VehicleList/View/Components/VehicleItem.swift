//
//  VehicleItem.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

// A view that displays a vehicle item with a title and subtitle.
struct VehicleItem: View {

    // The main title text for the vehicle item.
    let titleText: String
    // The subtitle text for additional information about the vehicle.
    let subTitleText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(titleText)
                .font(.headline)
                .foregroundColor(.primary)
            Text(subTitleText)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
