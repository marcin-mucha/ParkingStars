//
//  BetRowView.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import SwiftUI

struct BetRowView: View {
    var model: BetRowModel
    var body: some View {
        HStack(spacing: 10) {
            if model.isWinning {
                Image(systemName: "car.fill")
            } else {
                Image(systemName: "xmark.circle")
            }
            
            if model.isUser {
                Text(model.bet.bettor.name)
                    .bold()
            } else {
                Text(model.bet.bettor.name)
            }

            Spacer()
            Text("⭐️ \(model.bet.value)")
        }
        .listRowBackground(model.rowColor)
    }
}

struct BetRowView_Previews: PreviewProvider {
    static var previews: some View {
        BetRowView(model: BetRowModel(bet: Bet(id: 1, value: 10, bettor: Bettor(id: "1", name: "Michał Apanowicz", stack: 400), date: Date()), isWinning: true, isUser: true))
        .previewLayout(PreviewLayout.fixed(width: 375, height: 100))
    }
}

struct BetRowModel: Identifiable {
    var id: Int {
        bet.id
    }
    
    let bet: Bet
    let isWinning: Bool
    let isUser: Bool
}

extension BetRowModel {
    var rowColor: Color {
        isWinning ? Color.green.opacity(0.2) : Color.clear
    }
}
