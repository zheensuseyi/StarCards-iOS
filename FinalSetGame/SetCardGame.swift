//
//  SetCardGame.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

// FIXME: Fix alerts, see model
class SetCardGame: ObservableObject {
    // our model, initalized here
    @Published var game = GameSettings()
    
    // MARK: model variables
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
    
    // function for card getting tapped (toggles isSelected)
    func cardTapped(_ cardID: Int) {
        game.cardTapped(cardID)
    }
    
    // function that checks answer
    func checkAnswer(){
        // any card that has isSelected will be added to this deck
        var deckToSend: [GameSettings.Card] = []
        for card in gameDeck {
            if card.isSelected {
                deckToSend.append(card)
            }
        }
        print("Number of cards in deck: \(deckToSend.count)")
        // if deckToSend has 3 cards in it, then check the answer, otherwise this function does nothing
        if deckToSend.count == 3 {
            game.checkAnswer(deckToSend)
        }
    }
    
    // function that starts a new game, will add back in with alert
  /*  func newGame() {
        game.newGame()
    }*/
    
    // function that adds 3 cards
    func addThreeCards() {
        game.addCards()
    }
    
    // FIXME: Probably move these somewhere else
    var gameLostAlert: Alert {
        Alert(title: Text("Game Over"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Dismiss")))
    }
    var gameWonAlert: Alert {
        Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Dismiss")))
    }
    
}
