//
//  RestRoomMiddleware.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

func restRoomMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case .FetchRestRooms(let lat, let long):
            getRestRoomByLatAndLong(lat: lat, long: long, dispatch: dispatch)
        default:
            break
        }
    }
}

private func getRestRoomByLatAndLong(lat: Double, long: Double, dispatch: @escaping Dispatcher) {
    Webservice().getRestRoomByLatAndLong(lat: lat, long: long) { result in
        switch result {
        case.success(let restRooms):
            if let restRooms = restRooms {
                dispatch(.SetRestRooms(restRooms))
            }
        case .failure(let error):
            dispatch(.Fail(error))
        }
    }
}
