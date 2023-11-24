//
//  AppReducer.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.restRoomState = restRoomReducer(state.restRoomState, action)
    return state
}
