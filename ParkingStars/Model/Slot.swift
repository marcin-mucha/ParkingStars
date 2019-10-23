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
        Bettor(id: "123", name: "Michał Apanowicz", stack: 400),
        Bettor(id: "124", name: "Jacek Kwiecień", stack: 340),
        Bettor(id: "125", name: "Marcin Mucha", stack: 240),
        Bettor(id: "126", name: "Artur Glier", stack: 150),
        Bettor(id: "127", name: "Iwo Polański", stack: 400),
        Bettor(id: "128", name: "Patryk Zięba", stack: 340),
        Bettor(id: "129", name: "Paulina Kowalska", stack: 240),
        Bettor(id: "130", name: "Filip Misztal", stack: 150),
        Bettor(id: "131", name: "Rafał Wójcik", stack: 400),
        Bettor(id: "132", name: "Rafał Adamek", stack: 340),
        Bettor(id: "133", name: "Katarzyna Głąb", stack: 240),
        Bettor(id: "134", name: "Przemysław Petka", stack: 150),
        Bettor(id: "135", name: "Sebastian Łosiński", stack: 400),
        Bettor(id: "136", name: "Konard Pietrzkiewicz", stack: 340),
        Bettor(id: "137", name: "Michał Matoga", stack: 240),
        Bettor(id: "138", name: "Maciej Walczyński", stack: 150)
    ]
}


