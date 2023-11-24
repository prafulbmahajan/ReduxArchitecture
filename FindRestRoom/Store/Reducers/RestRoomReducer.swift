//
//  RestRoomReducer.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

func restRoomReducer(_ state: RestRoomState, _ action: Action) -> RestRoomState {
    var state = state
    switch action {
    case .SetRestRooms(let restRooms):
        state.restRooms = restRooms
    default:
        break
    }
    return state
}
