//
//  AspectVGrid.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/17/25.
//

import SwiftUI

// FIXME: Fix the animations, maybe have to do this in another struct
struct AspectVGrid: View {
    @ObservedObject var vm: SetCardGame
   // @State private var isSelected: Bool = false
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.startingDeck) { card in
                    Button(action: {
                        vm.choose(card.id)
                    })
                    {
                    HStack {
                        ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                            Image(systemName: "\(card.shape)")
                            // color of the shapes
                                .foregroundStyle(card.color.initalizeCardColor(card.color))
                        }
                    }
                    .background(card.shading.initalizeCardColor(card.shading))
                }
                    .rotationEffect(.degrees(card.isSelected ? 180 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: card.isSelected)
            }
            .font(.largeTitle)
            .aspectRatio(contentMode: .fill)
            .padding()
        }
    }
}

#Preview {
    AspectVGrid(vm: SetCardGame())
}
