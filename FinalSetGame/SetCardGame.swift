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
    
    @Published var gameLost: Bool = false
    @Published var gameWon: Bool = false
    init() {
        syncWithModel()
    }
    
    // MARK: Functions
    
    func cardTapped(_ cardID: Int) {
        game.cardTapped(cardID)
    }
    
    func checkAnswer() {
        var deckToSend: [GameSettings.Card] = []
        for card in gameDeck {
            if card.isSelected {
                deckToSend.append(card)
            }
        }
        print("Number of cards in deck: \(deckToSend.count)") // for debugging
        if deckToSend.count == 3 {
            game.checkAnswer(deckToSend)
        }
        syncWithModel()
    }
    
    func addThreeCards() {
        game.addCards()
        syncWithModel()
    }
    
    // function that starts a new game, will add back in with alert
    func newGame() {
        game.newGame()
        syncWithModel()
    }

    func syncWithModel() {
        gameLost = game.gameLost
        gameWon = game.gameWon
    }
    
    // FIXME: Probably move these somewhere else
    var gameLostAlert: Alert {
        Alert(title: Text("Game Over"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Try again?"), action: { [self] in newGame()}))
    }
    var gameWonAlert: Alert {
        Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Play again?"), action: { [self] in newGame()}))
    }
    var incorrectGuessAlert: Alert {
        Alert(title: Text("Incorrect"), message: Text("You just lost 9 points"), dismissButton: .default(Text("Dismiss")))
    }
    
}
