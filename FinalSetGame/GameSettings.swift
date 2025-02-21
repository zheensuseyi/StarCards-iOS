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
    var idCounter = 0
    var gameLost = false
    var gameWon = false
    init() {
        let colorArray: [String] = ["Red", "Cyan", "Green"]
        let shadingArray: [String] = ["Gray", "Orange", "Purple"]
        let shapeArray: [String] = ["square.fill", "triangle.fill", "circle.fill"]
        cardDeck = []
        for color in colorArray {
            for shading in shadingArray {
                for shape in shapeArray {
                    for number in 1...3 {
                        cardDeck.append(Card(id:idCounter, shape: shape, numberOfShapes: number, shading: shading, color: color))
                        idCounter += 1
                    }
                }
            }
        }
        cardDeck = cardDeck.shuffled()
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
    mutating func checkAnswer(_ deck: [Card]) {
        var colorArray: [String] = []
        var shapeArray: [String] = []
        var numberArray: [Int] = []
        var shadingArray: [String] = []
        for i in deck {
            colorArray.append(i.color)
            shapeArray.append(i.shape)
            numberArray.append(i.numberOfShapes)
            shadingArray.append(i.shading)
        }
        var colorDict: [String: Int] = [:]
        var shapeDict: [String: Int] = [:]
        var numberDict: [Int: Int] = [:]
        var shadingDict: [String: Int] = [:]
        
        for color in colorArray {
            colorDict[color, default: 0] += 1
        }
        for shape in shapeArray {
            shapeDict[shape, default: 0] += 1
        }
        for number in numberArray {
            numberDict[number, default: 0] += 1
        }
        for shading in shadingArray {
            shadingDict[shading, default: 0] += 1
        }
        
        let colorValues = Array(colorDict.values)
        let shapeValues = Array(shapeDict.values)
        let numberValues = Array(numberDict.values)
        let shadingValues = Array(shadingDict.values)
        
        let colorSum = colorValues.reduce(0, +)
        let shapeSum = shapeValues.reduce(0, +)
        let numberSum = numberValues.reduce(0, +)
        let shadingSum = shadingValues.reduce(0, +)

        let totalSum = [colorSum, shapeSum, numberSum, shadingSum]
        
        for num in totalSum {
            if num != 3 || num != 6 {
                score -= 25
                if score < 1 {
                    gameLost = true
                }
            }
        }
        gameWon = true
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
