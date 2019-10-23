//
//  AuctionStore.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import Foundation
import Combine

let numberOfParkingSlots = 5

final class AuctionStore: ObservableObject {
    enum StoreError: Error {
        case invalidBetSize
        case insuffcientStack
        case betAlreadyExists
    }
    
    private var bets = CurrentValueSubject<[Bet], Never>([])
    
    @Published var output: [Bet] = []
    var minimumBetPossible: Int {
        return bets.value.minimumWinningValue
    }
    
    var subscriptions: [AnyCancellable] = []
    
    init() {
        bets.assign(to: \.output, on: self)
            .store(in: &subscriptions)
    }
    
    func createBet(value: Int, bettor: Bettor) throws {
        guard bets.value.minimumWinningValue...bettor.stack ~= value else { throw StoreError.invalidBetSize }
        guard !bets.value.contains(where: { $0.bettor.id == bettor.id }) else { throw StoreError.betAlreadyExists }
        let newBet = Bet(id: UUID().hashValue, value: value, bettor: bettor, date: Date())
        var newBets = bets.value
        newBets.append(newBet)
        bets.value = newBets.sorted(by: { $0.isGreater(than: $1) })
    }
    
    func startGenerating() {
        AuctionDay.bettors.forEach { bettor in
            let delay: TimeInterval = Double.random(in: 2...10)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
                guard let self = self else { return }
                let minimumValue = self.bets.value.minimumWinningValue
                let maximumValue = bettor.stack
                do {
                    guard minimumValue < maximumValue else { throw StoreError.insuffcientStack }
                    let value = Int.random(in: minimumValue...maximumValue)
                    try self.createBet(value: value, bettor: bettor)
                } catch {
                    debugPrint("Generating bet error: \(error)")
                }
            }
        }
    }
}

extension Array where Element == Bet {
    var minimumWinningValue: Int {
        guard !isEmpty else { return 0 }
        let sortedBets = sorted { $0.isGreater(than: $1) }
        let lastWinningIndex = Swift.min(self.count - 1, numberOfParkingSlots)
        return sortedBets[lastWinningIndex].value
    }
}

extension Bet {
    func isGreater(than bet: Bet) -> Bool {
        if value > bet.value {
            return true
        } else if value == bet.value {
            return date.compare(bet.date) == .orderedAscending
        } else {
            return false
        }
    }
}
