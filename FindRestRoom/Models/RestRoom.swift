//
//  RestRoom.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

struct RestRoom: Decodable {

    let id: Int
    let name: String?
    let street: String
    let city: String
    let state: String
    let accessible: Bool
    let unisex: Bool
    let distance: Double
    let comment: String?
    let latitude: Double
    let longitude: Double
    var address: String {
        "\(street), \(city) \(state)"
    }
}
