//
//  ContentView.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI

struct SlotView: View {
    var slot: Slot
    var body: some View {
        HStack {
            ZStack {
                Image("slot-1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(idealWidth: 100, maxWidth: 100, idealHeight: 88, maxHeight: 100)
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
            }
        }
    }
}

struct SlotsView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView(slot: Slot.dummySlots[0])
                    .previewLayout(PreviewLayout.fixed(width: 375, height: 100))
    }
}

extension Slot {
    static let dummySlots = [
        Slot(id: "101", name: "Spot im. Konrada Pietrzkiewicza", imageName: "slot-1", bets: [
            Bet(value: 140, bettor: bettors[0], date: Date()),
            Bet(value: 120, bettor: bettors[1], date: Date()),
            Bet(value: 100, bettor: bettors[2], date: Date()),
            Bet(value: 90, bettor: bettors[3], date: Date())
        ]),
        Slot(id: "102", name: "001", imageName: "slot-2", bets: [
            Bet(value: 140, bettor: bettors[0], date: Date()),
            Bet(value: 120, bettor: bettors[1], date: Date()),
            Bet(value: 100, bettor: bettors[2], date: Date()),
            Bet(value: 90, bettor: bettors[3], date: Date())
        ]),
        Slot(id: "103", name: "001", imageName: "slot-3", bets: [
            Bet(value: 140, bettor: bettors[0], date: Date()),
            Bet(value: 120, bettor: bettors[1], date: Date()),
            Bet(value: 100, bettor: bettors[2], date: Date()),
            Bet(value: 90, bettor: bettors[3], date: Date())
        ]),
        Slot(id: "104", name: "001", imageName: "slot-4", bets: [
            Bet(value: 140, bettor: bettors[0], date: Date()),
            Bet(value: 120, bettor: bettors[1], date: Date()),
            Bet(value: 100, bettor: bettors[2], date: Date()),
            Bet(value: 90, bettor: bettors[3], date: Date())
        ]),
        Slot(id: "105", name: "001", imageName: "slot-5", bets: [
            Bet(value: 140, bettor: bettors[0], date: Date()),
            Bet(value: 120, bettor: bettors[1], date: Date()),
            Bet(value: 100, bettor: bettors[2], date: Date()),
            Bet(value: 90, bettor: bettors[3], date: Date())
        ]),
        Slot(id: "106", name: "001", imageName: "slot-6", bets: [
            Bet(value: 140, bettor: bettors[0], date: Date()),
            Bet(value: 120, bettor: bettors[1], date: Date()),
            Bet(value: 100, bettor: bettors[2], date: Date()),
            Bet(value: 90, bettor: bettors[3], date: Date())
        ])
    ]
    
    static let bettors = [
        Bettor(id: "123", name: "Michał Apanowicz", stack: 400),
        Bettor(id: "124", name: "Jacek Kwiecień", stack: 340),
        Bettor(id: "125", name: "Marcin Mucha", stack: 240),
        Bettor(id: "126", name: "Artur Glier", stack: 150)
    ]
}
