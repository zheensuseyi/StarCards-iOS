//
//  GameSettings.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//

// FIXME: flesh out the program more
import Foundation
struct GameSettings {
    var cardDeck: [Card]
    private(set)var score = 81
    var gameLost = false
    var gameWon = false
    init() {
        cardDeck = []
        cardDeck = initalizeDeck().shuffled()
    }
    
    mutating func initalizeDeck() -> [Card] {
        var tempDeck: [Card] = []
        let colorArray: [String] = ["Red", "Cyan", "Green"]
        let shadingArray: [String] = ["Gray", "Orange", "Purple"]
        let shapeArray: [String] = ["star.fill", "triangle.fill", "circle.fill"]
        var idCounter = 0
        for color in colorArray {
            for shading in shadingArray {
                for shape in shapeArray {
                    for number in 1...3 {
                        tempDeck.append(Card(id:idCounter, shape: shape, numberOfShapes: number, shading: shading, color: color))
                        idCounter += 1
                    }
                }
            }
        }
        return tempDeck
    }
    
    // FIXME: Test this function
    mutating func newGame() {
        cardDeck = initalizeDeck().shuffled()
        score = 81
        gameLost = false
        gameWon = false
    }
    // adding and removing cards, its how currentDeck gets initalized and how cards get added to that deck
    mutating func addAndRemoveCards(numberOfCards: Int) -> [Card]{
        var tempDeck: [Card] = []
        for i in 0..<numberOfCards {
            tempDeck.append(cardDeck[i])
        }
        score -= numberOfCards
        if score < 0 {
            gameLost = true
        }
        cardDeck.removeFirst(numberOfCards)
        return tempDeck
    }
    
    
    // FIXME: this function is a joke, make it better
    mutating func checkAnswer(_ deck: [Card]) -> Int {
        var colorDict: [String: Int] = [:]
        var shapeDict: [String: Int] = [:]
        var numberDict: [Int: Int] = [:]
        var shadingDict: [String: Int] = [:]
   
        for i in deck {
            colorDict[i.color, default: 0] += 1
            shapeDict[i.shape, default: 0] += 1
            numberDict[i.numberOfShapes, default: 0] += 1
            shadingDict[i.shading, default: 0] += 1
        }
        
        let maxColor: Int = colorDict.max { $0.value < $1.value}!.value
        let maxShape: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxNumber: Int = shapeDict.max { $0.value < $1.value}!.value
        let maxShading: Int = shadingDict.max { $0.value < $1.value}!.value

        let totalSum = [maxColor, maxShape, maxNumber, maxShading]
        print(totalSum)
        
        for num in totalSum {
            if num == 2 {
                print("Bad Choice, num is \(num)")
                score -= 9
                return score
            }
        }
        score += 100
        return score
    }
    
    

    struct Card: Identifiable{
        var id: Int
        var shape: String
        var shading: String
        var color: String
        var numberOfShapes: Int
        var isSelected: Bool = false
        init(id: Int, shape: String, numberOfShapes: Int, shading: String, color: String) {
            self.id = id
            self.shape = shape
            self.numberOfShapes = numberOfShapes
            self.shading = shading
            self.color = color
        }
    }
}
