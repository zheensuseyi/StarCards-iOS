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
    var score: Int {
        return game.score
    }
    var setAlert: Alert {
        Alert(title: Text("\(setText)"), message: Text("Your score is now \(score)"), dismissButton: .default(Text("Dismiss")))
    }
    var setText: String = ""
    @Published var startingDeck: [GameSettings.Card] = []
    init() {
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
        setText = game.checkAnswer(deckToSend)
    }
    
    func initalizeCard(card: GameSettings.Card) {
        
    }
    
}
