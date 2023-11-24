//
//  FindRestRoomApp.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import SwiftUI

@main
struct FindRestRoomApp: App {
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [restRoomMiddleware()])
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
