//
//  MenuButton.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

// Custom view for a dropdown menu button that allows users to select sorting options.
struct DropMenuButton: View {

    // Closure that is called when a menu item is selected, passing the selected sorting option.
    var menuItemSelected: (_ item: SortVehicleOption) -> ()

    var body: some View {
        // A Menu view that displays sorting options when tapped.
        Menu {
            // Title for the sorting options menu.
            Text("Sort by:")
                .font(.subheadline) // Set the font style for the title.
            // Button to sort by VIN.
            Button(action: {
                // Call the menuItemSelected closure with the VIN sorting option.
                menuItemSelected(.vin)
            }) {
                Text("Vin") // Label for the button.
            }
            // Button to sort by vehicle type.
            Button(action: {
                // Call the menuItemSelected closure with the type sorting option.
                menuItemSelected(.type)
            }) {
                Text("Type") // Label for the button.
            }
        } label: {
            // Icon displayed on the button for the dropdown menu.
            Image(systemName: "line.horizontal.3.decrease")
                .padding(8)
        }
        .padding()  // Add padding around the entire menu button.
        .frame(width: 40, height: 40) // Set the size of the menu button.
        .background(
            // Rounded rectangle background for the dropdown button.
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.accentColor, lineWidth: 2)
        )
    }
}
