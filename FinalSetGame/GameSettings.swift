//
//  GameSettings.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

// FIXME: Fix the alerts, probably make a function that triggers when score is 0 and returns an alert
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
    
    
    // initalizing decks
    init() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
    }
    
    // MARK: Game functions
    // function for when user taps on a card
    mutating func cardTapped(_ cardID: Int) {
        if let indexOfCard = gameDeck.firstIndex(where: { $0.id == cardID }) {
            gameDeck[indexOfCard].isSelected.toggle()
            print("\(gameDeck[indexOfCard]) is toggled")  // for debugging
        }
    }
    // function for adding 3 cards
    mutating func addCards() {
        for i in 0..<3 {
            gameDeck.append(fullDeck[i])
        }
        score -= 3
        scoreCheck()
        fullDeck.removeFirst(3) // deleting cards from full deck, so all cards are unique
    }
    
    // function to start a new game
    mutating func newGame() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
        score = 63
        gameOver = false
        incorrectGuess = false
    }
    
    // function for checking if the user gave us a set or not
    mutating func checkAnswer(_ deck: [Card]) -> () {
        var colorDict: [String: Int] = [:]
        var shapeDict: [String: Int] = [:]
        var numShapesDict: [Int: Int] = [:]
        var bgColorDict: [String: Int] = [:]
        
        // deselecting the cards in gameDeck
        deselectCards()
        
        for i in deck {
            colorDict[i.color, default: 0] += 1
            shapeDict[i.shape, default: 0] += 1
            numShapesDict[i.numberOfShapes, default: 0] += 1
            bgColorDict[i.bgColor, default: 0] += 1
        }
        
        let maxColor: Int = colorDict.max { $0.value < $1.value}!.value
        let maxShape: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxNumShapes: Int = numShapesDict.max { $0.value < $1.value}!.value
        let maxBGColor: Int = bgColorDict.max { $0.value < $1.value}!.value
        let totalSum = [maxShape, maxColor, maxNumShapes, maxBGColor]
        
        // now finding out if its a set or not
        findSet(totalSum)
        if !gameOver {
            incorrectGuess = true
        }
    }
    
    // MARK: Helper functions for the game (check answer, add 3 cards)
    // helper function that checks if a card is a set or not
    mutating func findSet(_ totalSum: [Int]) -> () {
        for freq in totalSum {
            if freq == 2 { // if it isnt a set, deduct 9 points and return the score
                score -= 9
                scoreCheck()
                return
            }
        }
        gameOver = true
        return
    }
    
    // helper function that checks if the game is lost
    mutating func scoreCheck() {
        if score < 1 {
            gameOver = true
        }
    }
    mutating func resetGuess() {
        incorrectGuess = false
    }
    
    // helper function that deselects all the selected cards in the deck
    mutating func deselectCards() {
        for card in 0..<gameDeck.count {
            if gameDeck[card].isSelected {
                gameDeck[card].isSelected.toggle()
                print("\(gameDeck[card]) is now unselected")  // for debugging
            }
        }
    }
    
    
    // MARK: Helper functions for initalizing decks
    // helper function for initalizing full deck
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
    
    // helper function for initalizing game deck
    mutating func initalizeGameDeck() -> [Card]{
        var tempDeck: [Card] = []
        for i in 0...11 {
            tempDeck.append(fullDeck[i])
        }
        fullDeck.removeFirst(12)
        return tempDeck
    }
    
}
