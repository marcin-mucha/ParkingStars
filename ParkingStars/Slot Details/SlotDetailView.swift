//
//  SlotDetailView.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI

struct SlotDetailView: View {
    @State private var betValue: Int = 0
    var slot: Slot
    
    var body: some View {
        VStack { //}(alignment: .leading) {
            ZStack {
                Image(slot.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                Text(slot.id)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(slot.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("Highest bet:")
                        .font(.subheadline)
                        .lineLimit(1)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(slot.highestBet?.value ?? 0)")
                        .font(.subheadline)
                        .lineLimit(1)
                }
                Stepper(value: $betValue, in: slot.minimumBetPossible...400, step: 10) {
                    Text("Bet amount \(betValue)")
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .onAppear {
            self.betValue = self.slot.minimumBetPossible
        }
    }
}

struct SlotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SlotDetailView(slot: Slot.dummySlots[0])
    }
}


