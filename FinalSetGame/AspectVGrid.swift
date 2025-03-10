//
//  AspectVGrid.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/17/25.
//

import SwiftUI

struct AspectVGrid: View, Animatable {
    @ObservedObject var vm: SetCardGame
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns) {
            lazyVGridBuilder
                .paddingLargeTitleText()
        }
        .alert(isPresented: $vm.gameChange) {
            vm.gameAlert
        }
    }
    
    @ViewBuilder
    private var lazyVGridBuilder: some View {
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
        }
    }
}





#Preview {
    AspectVGrid(vm: SetCardGame())
}
