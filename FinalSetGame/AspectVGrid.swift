//
//  AspectVGrid.swift
//  FinalSetGame
//
//  Created by Zheen Suseyi on 2/17/25.
//

import SwiftUI

struct AspectVGrid: View {
    @ObservedObject var vm: SetCardGame
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.startingDeck) { card in
                Button(action: {
                    print("Card \(card.id) Is Now Selected")
                }) {
                HStack {
                    ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                            Image(systemName: "\(card.shape)")
                                .foregroundStyle(vm.initalizeCardColor(color: card.color))
                        }

                    }
                .background(vm.initalizeCardColor(color: card.shading))
                .padding()
                }
            .font(.largeTitle)
            .aspectRatio(contentMode: .fill)
            }
        }
    }
}

#Preview {
    AspectVGrid(vm: SetCardGame())
}
