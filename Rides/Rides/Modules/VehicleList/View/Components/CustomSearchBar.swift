//
//  CustomSearchBar.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct CustomSearchBar: View {

    @Binding var size: Int?
    var searchTapped: () -> ()
    var menuItemSelected: (_ item: SortVehicleOption) -> ()

    var body: some View {
        HStack {
            HStack {
                TextField("10", value: $size, format: .number)
                    .padding()
                    .frame(height: 40)
                    .keyboardType(.numberPad)
                    .foregroundStyle(Color.accentColor)
                Button(action: {
                    // Trigger the search when the button is tapped
                    searchTapped()
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.accentColor)
                }
                .frame(width: 40, height: 40)
            }
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            DropMenuButton(menuItemSelected: menuItemSelected)
        }
        .padding(8)
    }
}
