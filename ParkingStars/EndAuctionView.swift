//
//  EndAuctionView.swift
//  ParkingStars
//
//  Created by Michał Apanowicz on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI

struct EndAuctionView: View {
    @Environment(\.presentationMode) var presentationMode
    let model: EndAuctionModel

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if model.isWin {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(width: 100, height: 100)
                        Text("Congtatulations!")
                            .font(.title )
                            .lineLimit(1)
                        Text("You can use spot P002 tomorrow.\nYou paid \(model.value)⭐️")
                            .font(.body)
                            .lineLimit(2)
                    }

                } else {
                    VStack {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .foregroundColor(Color.red)
                            .frame(width: 100, height: 100)
                        Text("Sorry, you lost!")
                            .font(.title )
                            .lineLimit(1)
                        Text("Don't worry, keep trying!")
                            .font(.body)
                            .lineLimit(2)
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Dismiss")
            }))
        }
    }
}

struct EndAuctionModel {
    let isWin: Bool
    let value: Int
}

extension EndAuctionModel {
    static func make(from store: AuctionStore) -> EndAuctionModel {
        EndAuctionModel(isWin: store.userWiningBet != nil, value: store.userWiningBet?.value ?? 0)
    }
}

struct EndAuctionView_Previews: PreviewProvider {
    static var previews: some View {
        EndAuctionView(model: EndAuctionModel(isWin: true, value: 100))
    }
}
