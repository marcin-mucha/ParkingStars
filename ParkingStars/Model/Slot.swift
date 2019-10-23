//
//  Slot.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import Foundation

struct Slot: Identifiable, Decodable {
    let id: String
    let name: String
    let imageName: String
    let bets: [Bet]
}

struct Bettor: Identifiable, Decodable {
    let id: String
    let name: String
    let stack: Int
}

struct Bet: Decodable {
    let value: Int
    let bettor: Bettor
    let date: Date
}

extension Slot {
    var highestBet: Bet? {
        bets.sorted { $0.value > $1.value }.first
    }
    
    var minimumBetPossible: Int {
        return highestBet?.value ?? 0 + 10 // TODO: Step
    }
}
