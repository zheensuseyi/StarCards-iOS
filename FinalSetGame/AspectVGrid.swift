//
//  AspectVGrid.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/17/25.
//
 
import SwiftUI

// FIXME: Fix the animations and alerts
struct AspectVGrid: View {
    @ObservedObject var vm: SetCardGame
    // initalizing 3 flexible columns for our lazyvgrid
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        // putting all items in a grid aligned vertically
        LazyVGrid(columns: columns) {
            // iterating through our deck, making each item a button and rendering them for the user
            ForEach(vm.gameDeck) { card in
                // button applied to each card that will toggle two viewmodel functions
                Button(action: { 
                    // toggles isSelected
                    vm.cardTapped(card.id)
                    // if 3 cards are selected, checks the answer, returns the score, then deselects the cards
                    vm.checkAnswer()
                    
                })
                {
                    VStack {
                        // rendering our cards for the user
                        ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                            Image(systemName: "\(card.shape)")
                            // color of the shapes
                                .foregroundStyle(card.color.initalizeCardColor(card.color))
                        }
                    }
                    // background color is applied here, along with an animation when the card is selected
                    .background(card.bgColor.initalizeCardColor(card.bgColor))
                    .rotationEffect(.degrees(card.isSelected ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: card.isSelected)
                    // makes the cards bigger and more readable
                    .font(.largeTitle)
                }
                
               
            }
            .padding()
        }
    }
       
}

#Preview {
    AspectVGrid(vm: SetCardGame())
}
