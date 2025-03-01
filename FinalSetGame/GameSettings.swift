//
//  GameSettings.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

// FIXME: Fix the alerts, probably make a function that triggers when score is 0 and returns an alert
import Foundation
struct GameSettings {
    // MARK: Game variables
    private(set) var fullDeck: [Card] = []
    private(set) var gameDeck: [Card] = []
    private(set) var score = 63
    private(set) var gameWon = false
    private(set) var gameLost = false

    
    // MARK: Variables for creating the deck
    private let colorArray: [String] = ["Red", "Blue", "Yellow"]
    private let bgColorArray: [String] = ["Green", "Orange", "Purple"]
    private let shapeArray: [String] = ["star.fill", "triangle.fill", "circle.fill"]
    
    // initalizing our decks
    init() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
    }
    
    // function for when user taps on a card
    mutating func cardTapped(_ cardID: Int) {
        if let indexOfCard = gameDeck.firstIndex(where: { $0.id == cardID }) {
            gameDeck[indexOfCard].isSelected.toggle()
            print("\(gameDeck[indexOfCard]) is toggled")  // for debugging
        }
    }
    
    // function for checking if the user gave us a set or not
    mutating func checkAnswer(_ deck: [Card]) -> () {
        // initalizing dictionairies for every attribute
        var colorDict: [String: Int] = [:]
        var shapeDict: [String: Int] = [:]
        var numShapesDict: [Int: Int] = [:]
        var bgColorDict: [String: Int] = [:]
        
        // deselecting the cards in gameDeck
        deselectCards()
        
        // tracking the frequency for all the attributes
        for i in deck {
            colorDict[i.color, default: 0] += 1
            shapeDict[i.shape, default: 0] += 1
            numShapesDict[i.numberOfShapes, default: 0] += 1
            bgColorDict[i.bgColor, default: 0] += 1
        }
        
        // getting the highest frequency from each dict
        let maxColor: Int = colorDict.max { $0.value < $1.value}!.value
        let maxShape: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxNumShapes: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxBGColor: Int = bgColorDict.max { $0.value < $1.value}!.value
        
        // putting them all in an array
        let totalSum = [maxShape, maxColor, maxNumShapes, maxBGColor]
        // now finding out if its a set or not
        findSet(totalSum)
    }
    
    // helper function for checkAnswer
    mutating func findSet(_ totalSum: [Int]) -> () {
        for freq in totalSum {
            if freq == 2 { // if it isnt a set, deduct 9 points and return the score
                score -= 9
                gameLost = scoreCheck()
                return
            }
        }
        gameWon = true
        return
    }
    mutating func scoreCheck() -> Bool {
        if score < 1 {
            gameLost = true
        }
        return gameLost
    }

    
    // another helper function for checkAnswer
    mutating func deselectCards() {
        for card in 0..<gameDeck.count {
            if gameDeck[card].isSelected {
                gameDeck[card].isSelected.toggle()
                print("\(gameDeck[card]) is now unselected")  // for debugging
            }
        }
    }
    mutating func addCards() -> () {
        for i in 0..<3 {
            gameDeck.append(fullDeck[i])
        }
        score -= 3
        gameLost = scoreCheck()
        fullDeck.removeFirst(3) // deleting cards from full deck, so all cards are unique
        return
    }
    
    
    // FIXME: figure out what to do with gameWon and gameLost. Maybe combine both?
    mutating func newGame() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
        score = 63
        gameLost = false
        gameWon = false
    }
    
    // helper function to initalize cardDeck
    mutating func initalizeFullDeck() -> [Card] {
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
    
    
    // helper function to initalize gameDeck
    mutating func initalizeGameDeck() -> [Card]{
        var tempDeck: [Card] = []
        for i in 0...11 {
            tempDeck.append(fullDeck[i])
        }
        fullDeck.removeFirst(12)
        return tempDeck
    }
    
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
}
