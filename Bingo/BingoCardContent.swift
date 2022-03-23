//
//  BingoCardContent.swift
//  Bingo
//
//  Created by Paull Stanley on 3/11/22.
//

import SwiftUI

class BingoCardContent: ObservableObject {
    @Published private var model: BingoGame<String> = createBingoGame()
    
    var bingoCards: Array<BingoGame<String>.BingoCard> {
        return model.bingoCards
    }
    
    
    func choose(_ bingoCard: BingoGame<String>.BingoCard) {
        return model.choose(bingoCard)
    }
    
    private static func createBingoGame()-> BingoGame<String> {
        let allPhrases: Array<String> = ["Talking about eating well lately", "Facebook Drama", "Truckers", "TV show plots", "Gossiping about Christians Family/friends", "Drama between aunt and Grandma",  "Trailer Park Tea", "Dad comong home late", "Trump", "Dad drama at work", "Respecting others choise as it pertains to the vaccine", "Melting pot",  "Something in the trailer needs fixing","Ukraine/Russia", "I like your hair so much more short", "Belinda", "Asking dad to do something she can do herself", "yelling at her dog", "Complaining about megns kids getting up early", "mentioning someone else has a drinking problem", "mentioning needing to get cigs", "trip to walmart", "Puts wine in the freezer", "Uncle Billy", "Johnny"].shuffled()
        let phrases = allPhrases
        return BingoGame<String>(numberOfCards: 16) { index in
            return phrases[index]
        }
    }
    
    func resetGame() {
        model = BingoCardContent.createBingoGame()
    }
}
