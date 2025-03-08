//
//  GameSettings.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

import Foundation
struct GameSettings {
    // MARK: Card struct, a blueprint for creating a new card
    struct Card: Identifiable{
        var id: Int
        var shape: String
        var numberOfShapes: Int
        var color: String
        var bgColor: String
        var isSelected: Bool = false
        init(id: Int, shape: String, numberOfShapes: Int, color: String, bgColor: String) {
            self.id = id
            self.shape = shape
            self.numberOfShapes = numberOfShapes
            self.color = color
            self.bgColor = bgColor
        }
    }
    
    // MARK: Game variables
    private(set) var fullDeck: [Card] = []
    private(set) var gameDeck: [Card] = []
    private(set) var score = 63
    private(set) var gameOver = false
    private(set) var incorrectGuess = false
    
    init() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
    }
    
    // MARK: Game functions
    mutating func cardTapped(_ cardID: Int) {
        if let indexOfCard = gameDeck.firstIndex(where: { $0.id == cardID }) {
            gameDeck[indexOfCard].isSelected.toggle()
            print("\(gameDeck[indexOfCard]) is toggled")  // for debugging
        }
    }
    
    mutating func addCards() {
        for i in 0..<3 {
            gameDeck.append(fullDeck[i])
        }
        score -= 3
        scoreCheck() // helper function checks if game is lost
        fullDeck.removeFirst(3) // deleting cards from full deck, so all cards are unique
    }
    
    mutating func newGame() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
        score = 63
        gameOver = false
        incorrectGuess = false
    }
    
    // MARK: checkAnswer Function
    mutating func checkAnswer(_ deck: [Card]) {
        // helper function deselects cards in gameDeck
        deselectCards()
        // using helper function to count frequency of each attribute
        let maxColor = getMaxFrequency(from: deck, keyPath: \Card.color)
        let maxShape = getMaxFrequency(from: deck, keyPath: \Card.shape)
        let maxNumShapes = getMaxFrequency(from: deck, keyPath: \Card.numberOfShapes)
        let maxBGColor = getMaxFrequency(from: deck, keyPath: \Card.bgColor)
        
        let totalSum = [maxShape, maxColor, maxNumShapes, maxBGColor]
        
        findSet(in: totalSum) // helper function determines if set exists
        if !gameOver {
            incorrectGuess = true
        }
    }
    
    // MARK: Helper functions for checkAnswer
    func getMaxFrequency<Attribute: Hashable>(from deck: [Card], keyPath: KeyPath<Card, Attribute>) -> Int {
        var frequencyDict: [Attribute: Int] = [:]
        
        for card in deck {
            let value = card[keyPath: keyPath]
            frequencyDict[value, default: 0] += 1
        }
        
        return frequencyDict.values.max() ?? 0
    }
    
    mutating func findSet(in totalSum: [Int]) -> () {
        for freq in totalSum {
            if freq == 2 { // if it isnt a set, deduct 9 points, checkscore, and return
                score -= 9
                scoreCheck()
                return
            }
        }
        // else, game is won
        gameOver = true
        return
    }
    
    mutating func scoreCheck() {
        if score < 1 {
            gameOver = true
        }
    }
    
    mutating func resetGuess() {
        incorrectGuess = false
    }
    
    mutating func deselectCards() {
        for card in 0..<gameDeck.count {
            if gameDeck[card].isSelected {
                gameDeck[card].isSelected.toggle()
                print("\(gameDeck[card]) is now unselected")  // for debugging
            }
        }
    }
    
    
    // MARK: Helper functions for initalizing decks
    mutating func initalizeFullDeck() -> [Card] {
        // variables for creating the deck
        let colorArray: [String] = ["Red", "Blue", "Yellow"]
        let bgColorArray: [String] = ["Green", "Orange", "Purple"]
        let shapeArray: [String] = ["Star", "Triangle", "Circle"]
        
        var tempDeck: [Card] = []
        var idCounter = 0
        
        for shape in shapeArray {
            for numShapes in 1...3 {
                for color in colorArray {
                    for bgColor in bgColorArray {
                        tempDeck.append(Card(id:idCounter, shape: shape, numberOfShapes: numShapes, color: color, bgColor: bgColor))
                        idCounter += 1
                    }
                }
            }
        }
        return tempDeck.shuffled()
    }
    
    mutating func initalizeGameDeck() -> [Card]{
        var tempDeck: [Card] = []
        for i in 0...11 {
            tempDeck.append(fullDeck[i])
        }
        fullDeck.removeFirst(12)
        return tempDeck
    }
}

