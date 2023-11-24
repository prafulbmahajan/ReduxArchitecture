//
//  ContentView.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject private var locationManager = LocationManager()
    @EnvironmentObject var store: Store<AppState>
    @State private var cancellables: AnyCancellable? = nil

    struct Props {
        let restRooms: [RestRoom]
        let onFetchRestRoomsByLatLong: (Double, Double) -> Void
    }

    private func map(state: RestRoomState) -> Props {
        Props(restRooms: state.restRooms, onFetchRestRoomsByLatLong: { (lat, long) in
            store.dispatch(action: .FetchRestRooms(lat, long))
        })
    }

    var body: some View {
        let props = map(state: store.state.restRoomState)
        VStack {
            HStack {
                EmptyView()
            }.frame(maxWidth: .infinity, maxHeight: 44)
            Spacer()

            HStack {
                Text("Rest Rooms")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    locationManager.updateLocation()
                }) {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }.padding()
            
            List(props.restRooms, id: \.id) { restroom in
                RestRoomCell(restRoom: restroom) {
                    locationManager.openInMap(lat: restroom.latitude, long: restroom.longitude)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.660972445, green: 0.4933454875, blue: 0.4442506924, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
        
            .onAppear {
                self.cancellables = locationManager.$location.sink(receiveValue: { location in
                    if let location = location {
                        props.onFetchRestRoomsByLatLong(location.coordinate.latitude, location.coordinate.longitude)
                    }
                })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [restRoomMiddleware()])
        return ContentView().environmentObject(store)
    }
}
