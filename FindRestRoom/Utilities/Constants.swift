//
//  Constants.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

struct Constants {
    struct Urls {
        static func restroomsByLatAndLng(lat: Double, lng: Double) -> String {
            "https://www.refugerestrooms.org/api/v1/restrooms/by_location?lat=\(lat)&lng=\(lng)"
        }
    }
}
