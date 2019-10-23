//
//  ContentView.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var store: AuctionStore
    var body: some View {
        NavigationView {
            VStack {
                Text("Thursday, 24 October 2019")
                    .fontWeight(.thin)
                List {
                    ForEach(store.output.enumerated().compactMap { index, bet in
                        return BetRowModel(bet: bet, isWinning: (index < numberOfParkingSlots))
                    }) { model in
                        BetRowView(model: model)
                    }
                }
                NavigationLink(destination: BettingView(store: store), label: {
                    Text("BET!")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .background(Color.green)
                        .cornerRadius(14)
                })
            }
        .navigationBarItems(leading: Button(action: {}, label: { Text("Choose day") } ), trailing: Text("Wallet: ⭐️400"))
        .navigationBarTitle("ParkingStars")
        }
        .onAppear {
            self.store.startGenerating()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: AuctionStore())
    }
}
