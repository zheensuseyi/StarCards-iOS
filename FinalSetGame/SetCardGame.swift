//
//  SetCardGame.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

// FIXME: Maybe move startingDeck to the model, figure out how to call alerts. 
class SetCardGame: ObservableObject {
    @Published var game = GameSettings()
    @Published var cardDeck: [GameSettings.Card] = []
    @Published var score: Int = 0
    @Published var gameLost: Bool = false
    @Published var gameWon: Bool = false
    @Published var startingDeck: [GameSettings.Card] = []
    
    init() {
        score = game.score
        gameLost = game.gameLost
        gameWon = game.gameWon
        cardDeck = game.initalizeDeck()
        startingDeck = game.addAndRemoveCards(numberOfCards: 6)
    }
    
    var gameLostAlert: Alert {
        Alert(title: Text("Game Over"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Dismiss")))
    }
    var gameWinAlert: Alert {
        Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Dismiss")))
    }
    
    
    // MARK: functions that call model functions
    
    // adds 3 cards
    func addThreeCards() {
        let tempDeck = game.addAndRemoveCards(numberOfCards: 3)
        for i in tempDeck {
            startingDeck.append(i)
        }
        cardDeck = game.cardDeck
        score -= 3
    }
    // checks Answer
    func checkAnswer(){
        var deckToSend: [GameSettings.Card] = []
        for i in startingDeck {
            if i.isSelected {
                deckToSend.append(i)
            }
        }
        print("Number of cards sent: \(deckToSend.count)")
        score = game.checkAnswer(deckToSend)
        if score < 0 {
            print("You LOST")
        }
        else if score > 100 {
            print("you WON")
        }
    }
    
    // FIXME: Test these functions
    // function for new game
    func newGame() {
        game.newGame()
        syncWithModel()
    }
    
    // helper function for viewmodel
    func syncWithModel() {
        score = game.score
        cardDeck = game.cardDeck
        gameLost = game.gameLost
        gameWon = game.gameWon
    }
    
    func choose(_ cardID: Int) {
        if let indexOfCard = startingDeck.firstIndex(where: { $0.id == cardID }) {
            startingDeck[indexOfCard].isSelected.toggle()
            // debugging
            print("Toggling isSelected on \(startingDeck[indexOfCard].id)")
        }
    }
    
}
