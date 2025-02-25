//
//  SetCardGame.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

// FIXME: Fix alerts, see model
class SetCardGame: ObservableObject {
    @Published var game = GameSettings()
    
    var score: Int {
        return game.score
    }
    var gameDeck: [GameSettings.Card] {
        return game.gameDeck
    }
    
    private var fullDeck: [GameSettings.Card] {
        return game.fullDeck
    }
    var gameLost: Bool {
        return game.gameLost
    }
    var gameWon: Bool {
        return game.gameWon
    }
    
    // adds 3 cards
    func addThreeCards() {
        game.addCards()
    }
    // checks Answer
    func checkAnswer(){
        var deckToSend: [GameSettings.Card] = []
        for card in gameDeck {
            if card.isSelected {
                deckToSend.append(card)
            }
        }
        print("Number of cards in deck: \(deckToSend.count)")
        if deckToSend.count == 3 {
            game.checkAnswer(deckToSend)
        }
    }
    
    // function for new game
    func newGame() {
        game.newGame()
    }
    
    func cardTapped(_ cardID: Int) {
        game.cardTapped(cardID)
    }
    
    // FIXME: Probably move these somewhere else
    var gameLostAlert: Alert {
        Alert(title: Text("Game Over"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Dismiss")))
    }
    var gameWonAlert: Alert {
        Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Dismiss")))
    }
    
}
