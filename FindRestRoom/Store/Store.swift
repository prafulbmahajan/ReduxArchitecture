//
//  Store.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import Foundation

class Store<StoreState: ReduxState>: ObservableObject {
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]

    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }

    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
