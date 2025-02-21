//
//  SetCardGame.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import SwiftUI

//FIXME: Organize this code, theres no way this is how a viewmodel should look

class SetCardGame: ObservableObject {
    @Published var game = GameSettings()
    
    var cardDeck: [GameSettings.Card] {
        return game.cardDeck
    }
    var score: Int {
        return game.score
    }
    var gameLost: Bool {
        return game.gameLost
    }
    var gameWon: Bool {
        return game.gameWon
    }
    
    
    @Published var startingDeck: [GameSettings.Card] = []
    init() {
        let tempDeck = game.addAndRemoveCards(numberOfCards: 6)
        startingDeck = tempDeck
    }
    
    
    var gameLostAlert: Alert {
        Alert(title: Text("Game Over"), message: Text("Better luck next time.... Try again?"), dismissButton: .default(Text("Dismiss")))
    }
    var gameWinAlert: Alert {
        Alert(title: Text("You found a set!"), message: Text("You won! Your final score was \(score)"), dismissButton: .default(Text("Dismiss")))
    }
    
    func choose(_ cardID: Int) {
        if let indexOfCard = startingDeck.firstIndex(where: { $0.id == cardID }) {
            print("Toggling isSelected on \(startingDeck[indexOfCard].id)")
            startingDeck[indexOfCard].isSelected.toggle()
        }
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
    }
    
    
    func initalizeCardColor(color: String) -> Color {
        switch color {
        case "Red":
            return Color(.red)
        case "Cyan":
            return Color(.cyan)
        case "Green":
            return Color(.green)
        case "Gray":
            return Color(.gray)
        case "Orange":
            return Color(.orange)
        case "Purple":
            return Color(.purple)
        default:
            return Color(.red)
        }
    }
    
}
