//
//  SetCardGame.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI


class SetCardGame: ObservableObject {
    @Published var game = GameSettings()
    var cardDeck: [GameSettings.Card] {
        return game.cardDeck
    }
    @Published var startingDeck: [GameSettings.Card]
    
    init() {
        startingDeck = []
        let tempDeck = game.addAndRemoveCards(numberOfCards: 12)
        startingDeck = tempDeck
    }
    
    func addThreeCards() {
        let tempDeck = game.addAndRemoveCards(numberOfCards: 3)
        for i in tempDeck {
            startingDeck.append(i)
        }
    }
    func checkAnswer(startingDeck: [GameSettings.Card]){
        var deckToSend: [GameSettings.Card] = []
        for i in startingDeck {
            if i.isSelected {
                deckToSend.append(i)
            }
        }
        game.checkAnswer(deckToSend)
    }
    
}
