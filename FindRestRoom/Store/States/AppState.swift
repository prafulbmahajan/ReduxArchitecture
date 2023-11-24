//
//  AppState.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

protocol ReduxState {  }

struct AppState: ReduxState {
    var restRoomState: RestRoomState = RestRoomState()
}
