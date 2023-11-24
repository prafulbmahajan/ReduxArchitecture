//
//  RestRoomCell.swift
//  FindRestRoom
//
//  Created by Praful Mahajan on 24/11/23.
//

import SwiftUI

struct RestRoomCell: View {

    let restRoom: RestRoom
    let direction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(restRoom.name ?? "Not available")
                    .font(.headline)
                Spacer()
                Text(String(format: "%.2f miles", restRoom.distance))
            }.padding([.top], 10)

            Text(restRoom.address)
                .font(.subheadline)
                .opacity(0.5)

            Button("Directions") {
                direction()
            }.font(.caption)
                .foregroundColor(.white)
                .padding(6)
                .background(Color(#colorLiteral(red: 0.184266597, green: 0.8003296256, blue: 0.4435204864, alpha: 1)))
                .cornerRadius(6)

            Text(restRoom.comment ?? "")
                .font(.footnote)

            HStack {
                Text(restRoom.accessible ? "♿️" : "")
            }
        }
    }
}
