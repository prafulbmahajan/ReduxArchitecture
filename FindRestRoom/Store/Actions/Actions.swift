//
//  Actions.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

typealias Dispatcher = (Action) -> Void

enum Action {
    case FetchRestRooms(Double, Double)
    case SetRestRooms([RestRoom])
    case Fail(NetworkError)
}
