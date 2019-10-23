//
//  ContentView.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var slots: [Slot]
    var body: some View {
        NavigationView {
            List {
                ForEach(slots) { slot in
                    NavigationLink(destination: SlotDetailView(slot: slot)) {
                        SlotView(slot: slot)
                    }
                }
            }
            .navigationBarTitle("ParkingStars")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(slots: Slot.dummySlots)
    }
}
