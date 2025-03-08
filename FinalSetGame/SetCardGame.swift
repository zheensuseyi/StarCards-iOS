//
//  SetCardGame.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

// FIXME: Fix alerts, see model
class SetCardGame: ObservableObject {
    // MARK: Model initalization
    private var game = GameSettings()
    
    // MARK: model variables
    var score: Int {
        game.score
    }
    var gameDeck: [GameSettings.Card] {
        game.gameDeck
    }
    private var gameOver: Bool {
        game.gameOver
    }
    private var incorrectGuess: Bool {
        game.incorrectGuess
    }
    
    // MARK: Alert variable for view
    @Published var gameChange: Bool = false
    
    // MARK: Model Functions
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
        if deckToSend.count == 3 {
            game.checkAnswer(deckToSend)
        }
        syncWithModel()
    }
    
    func addCards() {
        game.addCards()
        syncWithModel()
    }
    
    
    // MARK: Updating gameChange
    private func syncWithModel() {
        if gameOver == true || incorrectGuess == true {
            gameChange = true
        }
        else {
            gameChange = false
        }
    }
    
    
    // MARK: alerts for view(s)
    var gameAlert: Alert {
        if score < 1 {
            Alert(title: Text("Game Over!"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Try again?"), action: { [self] in newGame()}))
        }
        else if gameOver {
            Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Play again?"), action: { [self] in newGame()}))
        }
        else {
            Alert(title: Text("Incorrect"), message: Text("That is not a set. You just lost 9 points!"), dismissButton: .default(Text("Dismiss"), action: { [self] in resetGuess()}))
        }
    }
    
    
    // MARK: Functions that only get called with alerts
    private func resetGuess() {
        game.resetGuess()
        syncWithModel()
    }
    
    private func newGame() {
        game.newGame()
        syncWithModel()
    }
    
    
    // MARK: Rendering cards for the view
    func initalizeCardShape(_ shapeName: String) -> Image {
        switch shapeName {
        case "Star":
            Image.star
        case "Triangle":
            Image.triangle
        case "Circle":
            Image.circle
        default:
            Image.triangle
        }
    }
    
    func initalizeCardColor(_ colorName: String) -> Color {
        switch colorName {
        case "Red":
            Color(.red)
        case "Yellow":
            Color(.yellow)
        case "Blue":
            Color(.blue)
        case "Green":
            Color(.green)
        case "Orange":
            Color(.orange)
        case "Purple":
            Color(.purple)
        default:
            Color(.red)
        }
    }
}

