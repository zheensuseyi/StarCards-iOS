//
//  GameSettings.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/14/25.
//
enum CardShape: CaseIterable {
    case circle, square, triangle
}

enum CardShading: CaseIterable {
    case solid, striped, outlined
}

enum CardColor: CaseIterable {
    case red, green, purple
}
import Foundation
struct GameSettings {
    var cardDeck: [Card]
    private(set)var score: Int = 0
    var idCounter = 0
    init() {
        cardDeck = []
        for shape in CardShape.allCases {
            for shading in CardShading.allCases {
                for color in CardColor.allCases {
                    for number in 1...3 {
                        let card = Card(id:idCounter, shape: shape, numberOfShapes: number, shading: shading, color: color)
                        cardDeck.append(card)
                        idCounter += 1
                    }
                }
            }
        }
        cardDeck = cardDeck.shuffled()
    }
    
    mutating func checkAnswer(_ deck: [Card]) {
        var colorArray: [CardColor] = []
        var shapeArray: [CardShape] = []
        var numberArray: [Int] = []
        var shadingArray: [CardShading] = []
        for i in deck {
            colorArray.append(i.color)
            shapeArray.append(i.shape)
            numberArray.append(i.numberOfShapes)
            shadingArray.append(i.shading)
        }
    }
    
    mutating func addAndRemoveCards(numberOfCards: Int) -> [Card]{
        var tempDeck: [Card] = []
        for i in 0..<numberOfCards {
            tempDeck.append(cardDeck[i])
        }
        cardDeck.removeFirst(numberOfCards)
        return tempDeck
    }
    

    struct Card: Identifiable{
        var id: Int
        var shape: CardShape
        var shading: CardShading
        var color: CardColor
        var numberOfShapes: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
        init(id: Int, shape: CardShape, numberOfShapes: Int, shading: CardShading, color: CardColor) {
            self.id = id
            self.shape = shape
            self.numberOfShapes = numberOfShapes
            self.shading = shading
            self.color = color
        }
    }
}
