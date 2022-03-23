//
//  GameModel.swift
//  Bingo
//
//  Created by Paull Stanley on 3/11/22.
//
import Combine
import SwiftUI

struct BingoGame<CardContent> {
    private(set)var bingoCards: Array<BingoCard>
    
    mutating func choose(_ bingoCard: BingoCard) {
        if let chosenIndex = bingoCards.firstIndex(where: { $0.id == bingoCard.id}), bingoCards[chosenIndex].isFaceUp {
            bingoCards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfCards: Int, createContent: (Int)-> CardContent) {
        bingoCards = Array<BingoCard>()
        for index in 0..<numberOfCards{
            let content: CardContent = createContent(index)
            bingoCards.append(BingoCard(id: index, content: content))
        } 
    }
    struct BingoCard: Identifiable {
        var isFaceUp: Bool = true
        var id: Int
        var content: CardContent
    }

}

