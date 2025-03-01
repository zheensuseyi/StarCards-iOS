//
//  AspectVGrid.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/17/25.
//
 
import SwiftUI

// FIXME: Fix the animations and alerts
struct AspectVGrid: View {
    @ObservedObject var vm: SetCardGame // getting our viewmodel
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var gameLost: Bool = false
    @State private var gameWon: Bool = false
    

    var body: some View {
        LazyVGrid(columns: columns) {  // putting all items in a grid aligned vertically
            // iterating through our deck, rendering each item for the user
            ForEach(vm.gameDeck) { card in
                Button(action: {
                    vm.cardTapped(card.id)
                    vm.checkAnswer()                    
                })
                {
                    // rendering our cards for the user
                    VStack {
                        ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                            Image(systemName: "\(card.shape)") // color of the shapes
                                .foregroundStyle(card.color.initalizeCardColor(card.color))
                        }
                    }
                    .background(card.bgColor.initalizeCardColor(card.bgColor))
                    .rotationEffect(.degrees(card.isSelected ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: card.isSelected)
                }
                .alert(isPresented: $vm.gameLost) {
                    vm.gameLostAlert
                }
                .alert(isPresented: $vm.gameWon) {
                    vm.gameWonAlert
                }
            
            }
            .font(.largeTitle)
            .padding()
        }
    }
}

#Preview {
    AspectVGrid(vm: SetCardGame())
}
