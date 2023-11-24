//
//  Webservice.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class Webservice {
    func getRestRoomByLatAndLong(lat: Double, long: Double, completion: @escaping (Result<[RestRoom]?, NetworkError>) -> Void) {
        guard let url = URL(string: Constants.Urls.restroomsByLatAndLng(lat: lat, lng: long)) else {
            completion(.failure(.badUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let restrooms = try? JSONDecoder().decode([RestRoom].self, from: data)
            completion(.success(restrooms))
        }.resume()
    }
}
