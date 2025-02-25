//
//  GameSettings.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

// FIXME: Fix the alerts, probably make a function that triggers when score is 0 and returns an alert
import Foundation
struct GameSettings {
    private(set) var fullDeck: [Card] = []
    private(set) var gameDeck: [Card] = []
    private(set) var score = 75
    private(set) var gameLost = false 
    private(set) var gameWon = false
    private let colorArray: [String] = ["Red", "Blue", "Yellow"]
    private let bgColorArray: [String] = ["Green", "Orange", "Purple"]
    private let shapeArray: [String] = ["star.fill", "triangle.fill", "circle.fill"]
    init() {
        fullDeck = initalizeFullDeck()
        gameDeck = initalizeGameDeck()
    }
    
    // function for when user taps on a card
    mutating func cardTapped(_ cardID: Int) {
         if let indexOfCard = gameDeck.firstIndex(where: { $0.id == cardID }) {
             gameDeck[indexOfCard].isSelected.toggle()
             // debugging
           //  print("Toggling isSelected on \(gameDeck[indexOfCard].id)")
         }
     }
    
    mutating func addCards() {
        for i in 0..<3 {
            gameDeck.append(fullDeck[i])
        }
        score -= 3
        if score < 1 {
            gameLost = true
            print("game lost is: \(gameLost)")

        }
        fullDeck.removeFirst(3)
    }
    
    // function for checking if the user gave us a set or not
    mutating func checkAnswer(_ deck: [Card]) -> () {
        // deselecting the cards in gameDeck
        for card in 0..<gameDeck.count {
            if gameDeck[card].isSelected {
                gameDeck[card].isSelected.toggle()
               // print("\(gameDeck[card]) is now unselected")
            }
        }
        var colorDict: [String: Int] = [:]
        var shapeDict: [String: Int] = [:]
        var numShapesDict: [Int: Int] = [:]
        var bgColorDict: [String: Int] = [:]
   
        for i in deck {
            colorDict[i.color, default: 0] += 1
            shapeDict[i.shape, default: 0] += 1
            numShapesDict[i.numberOfShapes, default: 0] += 1
            bgColorDict[i.bgColor, default: 0] += 1
        }
        
        let maxColor: Int = colorDict.max { $0.value < $1.value}!.value
        let maxShape: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxNumShapes: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxBGColor: Int = bgColorDict.max { $0.value < $1.value}!.value

        let totalSum = [maxShape, maxColor, maxNumShapes, maxBGColor]
      //  print(totalSum)
        
        for value in totalSum {
            // if it isnt a set, deduct 9 points and return the score
            if value == 2 {
                // for debugging
              //  print("Bad Choice, num is \(value)")
                score -= 9
                if score < 1 {
                    gameLost = true
                    print("game lost is: \(gameLost)")
                }
                return
            }
        }
        // else, add 100 points and return the score
        score += 100
        gameWon = true
        print("game won is: \(gameWon)")
        return
    }
    
    // makes a new game
    mutating func newGame() {
        fullDeck = initalizeFullDeck().shuffled()
        gameDeck = initalizeGameDeck()
        score = 75
        gameLost = false
        gameWon = false
    }
    
    // helper function to initalize cardDeck
    mutating func initalizeFullDeck() -> [Card] {
        var tempDeck: [Card] = []
        var idCounter = 0
        for color in colorArray {
            for bgColor in bgColorArray {
                for shape in shapeArray {
                    for number in 1...3 {
                        tempDeck.append(Card(id:idCounter, shape: shape, numberOfShapes: number, bgColor: bgColor, color: color))
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
        for i in 0..<6 {
            tempDeck.append(fullDeck[i])
        }
        fullDeck.removeFirst(6)
        return tempDeck
    }
    
    struct Card: Identifiable{
        var id: Int
        var shape: String
        var bgColor: String
        var color: String
        var numberOfShapes: Int
        var isSelected: Bool = false
        init(id: Int, shape: String, numberOfShapes: Int, bgColor: String, color: String) {
            self.id = id
            self.shape = shape
            self.numberOfShapes = numberOfShapes
            self.bgColor = bgColor
            self.color = color
        }
    }
}
