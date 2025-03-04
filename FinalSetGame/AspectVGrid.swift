//
//  AspectVGrid.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/17/25.
//
 
import SwiftUI

// FIXME: Fix the animations and alerts
struct AspectVGrid: View, Animatable {
    @ObservedObject var vm: SetCardGame
  /*  var rotation: Double
    var isSelected: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation}
        set { rotation = newValue }
    }
   */
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.gameDeck) { card in
                Button(action: {
                    vm.cardTapped(card.id)
                    vm.checkAnswer()                    
                })
                {
                    VStack {
                        ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                            vm.initalizeCardShape(card.shape)
                                .foregroundStyle(vm.initalizeCardColor(card.color))
                        }
                    }
                    .background(vm.initalizeCardColor(card.bgColor))
                    .rotationEffect(.degrees(card.isSelected ? 360 : 0))
                    .animation(Animation.default.rotate(card.isSelected), value: card.isSelected)
                }
                .alert(isPresented: $vm.gameOver) {
                    vm.gameOverAlert
                }
                .alert(isPresented: $vm.incorrectGuess) {
                    vm.incorrectGuessAlert
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
