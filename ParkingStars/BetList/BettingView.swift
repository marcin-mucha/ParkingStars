//
//  BettingView.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI

struct BettingView: View {
    @State var betValue: Int = 0
    @ObservedObject var store: AuctionStore
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Spacer()
                Text("Highest bid: ⭐️ \(store.output.first?.value ?? 0)")
                    .font(.subheadline)
                    .lineLimit(1)
                Spacer()
                Text("Bid amount:")
                    .fontWeight(.thin)
                    .font(.title)
                Text("\(betValue)")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                Stepper(value: $betValue, in: store.minimumBetPossible...500, step: 10) { Text("Raise 10") }
                Stepper(value: $betValue, in: store.minimumBetPossible...500, step: 1) { Text("Raise 1") }
            }
            Spacer()
            Button(action: {
                
            }, label: {
                Button(action: {
                    do {
                        try self.store.createUserBet(value: self.betValue)
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        self.showingAlert = true
                    }
                }, label: { Text("BID!")
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(Color.green)
                    .cornerRadius(14)
                })
            })
        }
        .navigationBarTitle("Your bid")
        .padding(.horizontal, 16)
        .onAppear {
            self.betValue = self.store.minimumBetPossible
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error").bold(), message: Text("Upss..."), dismissButton: Alert.Button.cancel())
        }
    }
}

struct BettingView_Previews: PreviewProvider {
    static var previews: some View {
        BettingView(store: AuctionStore())
    }
}
