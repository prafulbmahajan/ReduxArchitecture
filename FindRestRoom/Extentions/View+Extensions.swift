//
//  View+Extensions.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
