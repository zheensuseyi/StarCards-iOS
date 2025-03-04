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
    
    @Published var gameOver: Bool = false
    @Published var incorrectGuess: Bool = false
    
    init() {
        gameOver = game.gameOver
        incorrectGuess = game.incorrectGuess
    }

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
    

    // syncs gameLost and gameWon with model
    func syncWithModel() {
        gameOver = game.gameOver
        incorrectGuess = game.incorrectGuess
    }
    
    // MARK: Functions meant for the view (card initalization)
    func initalizeCardColor(_ color: String) -> Color {
        switch color {
        case "Red":
            return Color(.red)
        case "Yellow":
            return Color(.yellow)
        case "Blue":
            return Color(.blue)
        case "Green":
            return Color(.green)
        case "Orange":
            return Color(.orange)
        case "Purple":
            return Color(.purple)
        default:
            return Color(.red)
        }
    }
    func initalizeCardShape(_ shape: String) -> Image {
        switch shape {
        case "Star":
            return Image(systemName: "star.fill")
        case "Triangle":
            return Image(systemName: "triangle.fill")
        case "Circle":
            return Image(systemName: "circle.fill")
        default:
            return Image(systemName: "circle.fill")
        }
    }
    
    // function that starts a new game, will add back in with alert
    private func newGame() {
        game.newGame()
        syncWithModel()
    }
    
    private func resetGuess() {
        game.resetGuess()
        syncWithModel()
    }
    
    // MARK: alerts for views
    var gameOverAlert: Alert {
        if score < 1 {
            return Alert(title: Text("Game Over!"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Try again?"), action: { [self] in newGame()}))
        }
        else {
            return Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Play again?"), action: { [self] in newGame()}))
        }
    }

    var incorrectGuessAlert: Alert {
        Alert(title: Text("Incorrect"), message: Text("That is not a set. You just lost 9 points!"), dismissButton: .default(Text("Dismiss"), action: { [self] in resetGuess()}))
    }
    
    // MARK: Shapes for GameRulesView
    let Star = Image(systemName: "star.fill")
    let Triangle = Image(systemName: "triangle.fill")
    let Circle = Image(systemName: "circle.fill")
    
}
