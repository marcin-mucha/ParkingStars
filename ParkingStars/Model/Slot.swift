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

struct Bet: Identifiable, Decodable {
    let id: Int
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


/// New:

struct User {
    let id: String
    let name: String
    let stack: Int
}

struct AuctionDay {
    let date: Date
    let bets: [Bet]
}


extension AuctionDay {
    static let dummy = AuctionDay(date: Date(), bets: [
        Bet(id: 23, value: 140, bettor: bettors[0], date: Date()),
        Bet(id: 24, value: 120, bettor: bettors[1], date: Date()),
        Bet(id: 25, value: 100, bettor: bettors[2], date: Date()),
        Bet(id: 26, value: 90, bettor: bettors[3], date: Date())
    ])
    
    static let bettors = [
        Bettor(id: "123", name: "Andrzej", stack: 100),
        Bettor(id: "124", name: "Janusz", stack: 89),
        Bettor(id: "125", name: "Marcin Mucha", stack: 123),
        Bettor(id: "126", name: "Adam", stack: 114),
        Bettor(id: "127", name: "Tomasz", stack: 116),
        Bettor(id: "128", name: "Bronisław", stack: 147),
        Bettor(id: "129", name: "Donald", stack: 13),
        Bettor(id: "130", name: "Pszemek", stack: 78),

        Bettor(id: "131", name: "Marysia", stack: 89),
        Bettor(id: "132", name: "Kasia", stack: 100),
        Bettor(id: "133", name: "Ola", stack: 10),
        Bettor(id: "134", name: "Zuzia", stack: 21),
        Bettor(id: "135", name: "Antonina", stack: 123),
        Bettor(id: "136", name: "Lucyna", stack: 32),
        Bettor(id: "137", name: "Ela", stack: 24),
        Bettor(id: "138", name: "Ula", stack: 138)
    ]
}


