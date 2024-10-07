//
//  View+Extensions.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

// Extension to provide additional functionality to all SwiftUI Views.
extension View {
    // Send an action to resign the first responder, effectively dismissing the keyboard.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
